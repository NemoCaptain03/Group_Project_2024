import mysql.connector
import openai

openai.api_key = ""

# Define the simple traits and the formula-based questions
SIMPLE_TRAITS = {
    'Gender': 'Was this person {noun}?',
    'RealName': 'Was this person named {noun}?',
    'Nationality': 'Was this person from {noun}?',
    'BirthYear': 'Was this person born in {noun}?',
    'Achievements': 'Did this person achieve {noun}?',
    'Spouses': 'Was this person married to {noun}?'
}

# Define complex traits that require dynamic question generation
COMPLEX_TRAITS = ['Achievements', 'Spouses']

# Database connection (best practice: use context manager to manage DB connection)
def get_db_connection():
    db_config = {
        'user': 'root',
        'password': 'ducvandog900',
        'host': 'localhost',
        'port': 3306,
        'database': 'historical_figures',
        'auth_plugin': 'mysql_native_password',
        'charset': 'utf8mb4'
    }
    try:
        connection = mysql.connector.connect(**db_config)
        return connection
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        return None

def load_data():
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    query = """
    SELECT hf.ID, hf.HistoricalFigures, hf.Gender, hf.RealName, hf.Nationality,
           hf.BirthYear, GROUP_CONCAT(a.Achievement) AS Achievements,
           GROUP_CONCAT(s.Name) AS Spouses
    FROM HistoricalFigures hf
    LEFT JOIN Achievements a ON a.HistoricalFigureID = hf.ID
    LEFT JOIN Spouses s ON s.HistoricalFigureID = hf.ID
    GROUP BY hf.ID;
    """

    cursor.execute(query)
    figures = cursor.fetchall()

    # Xử lý giá trị NULL từ database
    for figure in figures:
        for key in figure:
            if figure[key] is None:
                figure[key] = "Unknown"  # Hoặc giá trị mặc định khác

    cursor.close()
    connection.close()

    return figures


def generate_question(trait_type, trait_value, figure_name=None):
    """Generate a question based on the trait type and value."""
    if trait_type in SIMPLE_TRAITS:
        return generate_simple_question(trait_type, trait_value)
    elif trait_type in COMPLEX_TRAITS and figure_name:
        return generate_complex_question(figure_name, trait_type, trait_value)
    return None

def generate_simple_question(trait_type, trait_value):
    """Generate a question for simple traits."""
    question_template = SIMPLE_TRAITS.get(trait_type)
    if question_template:
        return question_template.format(noun=trait_value)
    return None

def generate_complex_question(figure_name, trait_type, trait_value):
    """Generate a dynamic question for complex traits using GPT."""
    if trait_type not in ['Achievements', 'Spouses']:
        return None  # Chỉ xử lý Achievements và Spouses

    prompt = f"Generate a yes/no question based on the following trait: {trait_type} = {trait_value}. The figure is {figure_name}. Example: Does this person have a notable achievement related to {trait_value}?"

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

def get_next_trait(questions_so_far, available_traits):
    """Chỉ trả về Achievements hoặc Spouses nếu chưa hỏi."""
    for trait in available_traits:
        if trait in ['Achievements', 'Spouses'] and trait not in questions_so_far:
            return trait
    return None


def get_trait_value(trait, figure):
    """Retrieve the value of a trait for a given figure."""
    value = figure.get(trait, None)
    if value:
        return value  # Trả về giá trị nếu có
    return "Unknown"  # Thay thế N/A bằng Unknown hoặc bất kỳ giá trị nào khác bạn muốn


def create_categories():
    """Categorize the questions based on the columns in the database."""
    categories = {}
    list_of_column_names = ['Gender', 'Field', 'Position', 'Century', 'BirthYear', 'DeathYear', 'Nationality']
    # Add more categories as per the dataset structure
    categories['Personal Traits'] = ['Gender', 'Nationality', 'BirthYear', 'DeathYear']
    categories['Professional Traits'] = ['Field', 'Position', 'Achievements']
    categories['Historical Context'] = ['Century', 'PeriodOfActivity']
    return categories

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
