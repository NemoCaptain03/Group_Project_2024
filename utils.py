import mysql.connector
import openai

openai.api_key = ""

# Define the simple traits and the formula-based questions
SIMPLE_TRAITS = {
    'Gender': 'Was this person {noun}?',
    'Field': 'Did this person contribute to {noun}?',
    'Position': 'Did this person hold the position of {noun}?',
    'Century': 'Did this person live in the {noun} century?',
    'BirthYear': 'Was this person born in {noun}?',
    'DeathYear': 'Did this person die in {noun}?',
    'Nationality': 'Was this person from {noun}?'
}

# Define complex traits that require dynamic question generation
COMPLEX_TRAITS = ['Achievements', 'Spouses', 'ShortIntroduction', 'Works', 'Quotes', 'Relationships']


# Database connection (best practice: use context manager to manage DB connection)
def get_db_connection():
    db_config = {
        'user': 'root',
        'password': '',
        'host': 'localhost',
        'database': 'historical_figures',
    }
    return mysql.connector.connect(**db_config)


def load_data():
    """Load historical figure data from the database."""
    connection = get_db_connection()
    cursor = connection.cursor()

    query = """
    SELECT hf.ID, hf.HistoricalFigures, hf.Gender, hf.RealName, hf.Hometown, hf.Nationality,
           hf.PeriodOfActivity, hf.Century, hf.BirthYear, hf.DeathYear, hf.ShortIntroduction,
           GROUP_CONCAT(a.Achievement) AS Achievements,
           GROUP_CONCAT(s.Name) AS Spouses
    FROM HistoricalFigures hf
    LEFT JOIN Achievements a ON a.HistoricalFigureID = hf.ID
    LEFT JOIN Spouses s ON s.HistoricalFigureID = hf.ID
    GROUP BY hf.ID;
    """

    cursor.execute(query)
    figures = cursor.fetchall()

    headers = ['ID', 'HistoricalFigures', 'Gender', 'RealName', 'Hometown', 'Nationality',
               'PeriodOfActivity', 'Century', 'BirthYear', 'DeathYear', 'ShortIntroduction',
               'Achievements', 'Spouses']

    figures_dict = [dict(zip(headers, row)) for row in figures]

    cursor.close()
    connection.close()

    return figures_dict


def generate_question(trait_type, trait_value, figure_name):
    """Generate a question based on the trait type and value."""
    if trait_type in SIMPLE_TRAITS:
        return generate_simple_question(trait_type, trait_value)
    elif trait_type in COMPLEX_TRAITS:
        return generate_complex_question(figure_name, trait_type, trait_value)
    return None


def generate_simple_question(trait_type, trait_value):
    """Generate a question for simple traits."""
    question_template = SIMPLE_TRAITS.get(trait_type)
    if question_template:
        return question_template.format(noun=trait_value)
    return None


def generate_complex_question(figure_name, trait_type, trait_value):
    """Generate a dynamic question for complex traits using ChatGPT."""
    prompt = f"Generate a yes/no question based on the following trait: {trait_type} = {trait_value}. The figure is {figure_name}. For example: Does this person have a notable achievement related to {trait_value}?"

    try:
        response = openai.ChatCompletion.create(
            model="gpt-3.5-turbo",
            messages=[{
                "role": "system",
                "content": "You are a helpful assistant that generates yes/no questions for a Vietnamese historical akinator-like guessing game."
            }, {
                "role": "user",
                "content": prompt
            }]
        )
        return response['choices'][0]['message']['content'].strip()
    except openai.error.OpenAIError as e:
        print(f"Error generating question for {figure_name}: {e}")
        return "Could not generate a question at the moment."


def create_categories():
    """Categorize the questions based on the columns in the database."""
    categories = {}
    list_of_column_names = ['Gender', 'Field', 'Position', 'Century', 'BirthYear', 'DeathYear', 'Nationality']
    # Add more categories as per the dataset structure
    categories['Personal Traits'] = ['Gender', 'Nationality', 'BirthYear', 'DeathYear']
    categories['Professional Traits'] = ['Field', 'Position', 'Achievements']
    categories['Historical Context'] = ['Century', 'PeriodOfActivity']
    return categories


def add_new_figure(questions_so_far, answers_so_far, figures):
    """Allow the system to add a new figure to the database."""
    print("What historical figure were you thinking about?")
    new_figure_name = input()

    # Create a new figure with default answers (to be adjusted later)
    new_figure_answers = {str(i): 0.5 for i in range(len(questions_so_far))}

    # Ask the user for specific answers about this new figure
    for i, question in enumerate(questions_so_far):
        print(f"Please provide an answer to the question: {question}")
        answer = input("Answer (yes, probably yes, maybe, probably no, no): ").lower()
        new_figure_answers[str(i)] = update_probability(answer, new_figure_answers[str(i)])

    # Add new figure to figures list
    new_figure = {
        'HistoricalFigures': new_figure_name,
        'answers': new_figure_answers
    }
    figures.append(new_figure)

    # Save the new figure to the database
    save_new_figure_to_db(new_figure_name, new_figure_answers)


def save_new_figure_to_db(figure_name, answers):
    """Save the new figure to the database."""
    connection = get_db_connection()
    cursor = connection.cursor()

    # Insert the new figure into the database
    answer_values = [answers[str(i)] for i in range(len(answers))]
    query = f"INSERT INTO HistoricalFigures (HistoricalFigures, {', '.join([f'answer{i}' for i in range(len(answer_values))])}) VALUES ('{figure_name}', {', '.join(map(str, answer_values))})"

    cursor.execute(query)
    connection.commit()
    cursor.close()
    connection.close()
    print(f"New figure '{figure_name}' added to the database.")


def confirm_answer(probabilities, questions_so_far, answers_so_far, figures):
    """Ask the user to confirm the guessed historical figure."""
    sorted_probabilities = sorted(probabilities, key=lambda p: p['probability'], reverse=True)
    highest_prob_figure = sorted_probabilities[0]

    print(f"Did you think about {highest_prob_figure['name']}?")
    confirmation = input("Please respond with: yes, no, or maybe: ").lower()

    if confirmation == 'yes':
        print(f"Great! You were thinking about {highest_prob_figure['name']}.")
        return True
    else:
        print(f"Sorry, I will remove {highest_prob_figure['name']} from the possibilities.")
        figures = [f for f in figures if f['HistoricalFigures'] != highest_prob_figure['name']]
        return False


def update_questions(questions_so_far, categories, answer, question_key):
    """Update the question set based on the answers and remove irrelevant questions."""
    category = find_category(categories, question_key)
    if answer == 'yes' or answer == 'probably yes':
        # Keep relevant questions
        categories[category] = [q for q in categories[category] if q != question_key]
    else:
        # Remove irrelevant questions
        categories[category] = [q for q in categories[category] if q == question_key]

    return categories


def find_category(categories, col_num):
    """Find the category name based on the column number."""
    for category, columns in categories.items():
        if col_num in columns:
            return category
    return None


def update_probability(answer, current_probability):
    """Update probability based on the user’s answer."""
    if answer == 'yes':
        return 1
    elif answer == 'probably yes':
        return 0.75
    elif answer == 'maybe':
        return 0.5
    elif answer == 'probably no':
        return 0.25
    elif answer == 'no':
        return 0
    else:
        return current_probability


def update_figures_based_on_answer(figures, categories, question_column, answer):
    """Update the list of figures based on the user's answer."""
    if answer in ['yes', 'probably yes']:
        # Keep relevant figures
        return [f for f in figures if f['answers'].get(str(question_column)) == 1]
    else:
        # Remove irrelevant figures
        return [f for f in figures if f['answers'].get(str(question_column)) == 0]


def partition_data(answers_so_far, dataset):
    """Partition the dataset based on the answers given so far."""
    true_data = []
    false_data = []

    for data in dataset:
        match = True
        for question_index, answer in zip(answers_so_far.keys(), answers_so_far.values()):
            if data['answers'].get(str(question_index), 0.5) != answer:
                match = False
                break
        if match:
            true_data.append(data)
        else:
            false_data.append(data)

    return true_data, false_data


def calculate_probabilities(questions_so_far, answers_so_far, figures):
    """Calculate the probability of each historical figure based on the user's answers."""
    probabilities = []
    for figure in figures:
        figure_probability = 1.0
        for question_index, answer in zip(questions_so_far, answers_so_far):
            answer_prob = figure['answers'].get(str(question_index), 0.5)
            figure_probability *= max(1 - abs(answer - answer_prob), 0.01)

        probabilities.append({
            'name': figure['HistoricalFigures'],
            'probability': figure_probability
        })

    return probabilities


def check_prob(probabilities):
    """Check if the highest probability is high enough to confirm a guess."""
    if len(probabilities) > 1:
        highest_prob = probabilities[0]['probability']
        second_highest_prob = probabilities[1]['probability']

        # If the highest probability is more than 60% or the difference is larger than 40%
        if highest_prob >= 0.6 or (highest_prob - second_highest_prob) >= 0.4:
            return True
    return False


def delete_invalid_figures(probabilities, figures):
    """Remove figures with low probability."""
    min_probability = 0.0001
    valid_figures = [figure for figure in probabilities if figure['probability'] >= min_probability]

    # Remove invalid figures from the list of possible answers
    figures[:] = [figure for figure in figures if figure['HistoricalFigures'] in [f['name'] for f in valid_figures]]


def calculate_answer_probability(question_index, figure_answer, user_answer):
    """Calculate the likelihood of a figure given a user's answer."""
    if figure_answer == user_answer:
        return 1
    elif figure_answer == 0.5:
        return 0.5
    else:
        return 0.25


def delete_figure_from_list(figures, name):
    """Remove a figure from the possible options."""
    for figure in figures:
        if figure['HistoricalFigures'] == name:
            figures.remove(figure)
            break
