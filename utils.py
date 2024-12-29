# utils.py
import mysql.connector
import openai

openai.api_key = ""


# Define database connection
def get_db_connection():
    """
    Establish connection to the MySQL database.
    """
    db_config = {
        'user': 'root',
        'password': 'ducvandog900',
        'host': 'localhost',
        'port': 3306,
        'database': 'Historical_Figures',
        'auth_plugin': 'mysql_native_password'
    }
    try:
        connection = mysql.connector.connect(**db_config)
        return connection
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        return None


def load_data():
    """
    Load data from the database.
    """
    connection = get_db_connection()
    if not connection:
        return []

    cursor = connection.cursor(dictionary=True)
    query = """
    SELECT hf.ID, hf.HistoricalFigures, hf.Gender, hf.RealName, hf.Hometown,
           hf.Nationality, hf.PeriodOfActivity, hf.Century, hf.BirthYear,
           GROUP_CONCAT(a.Achievement) AS Achievements,
           GROUP_CONCAT(s.Name) AS Spouses
    FROM HistoricalFigures hf
    LEFT JOIN Achievements a ON a.HistoricalFigureID = hf.ID
    LEFT JOIN Spouses s ON s.HistoricalFigureID = hf.ID
    GROUP BY hf.ID;
    """

    cursor.execute(query)
    figures = cursor.fetchall()

    # Replace NULL values with "Unknown"
    for figure in figures:
        for key in figure:
            if figure[key] is None:
                figure[key] = "Unknown"

    cursor.close()
    connection.close()

    return figures


def generate_question(trait, value):
    """
    Generate a question based on the trait and value using GPT if available.
    """
    question_templates = {
        'Gender': "Was this person {value}?",
        'RealName': "Was this person named {value}?",
        'Nationality': "Was this person from {value}?",
        'BirthYear': "Was this person born in {value}?",
        'Achievements': "Did this person achieve {value}?",
        'Spouses': "Was this person married to {value}?"
    }

    # Use predefined templates for simple traits
    if trait in question_templates:
        return question_templates[trait].format(value=value)

    # Use GPT for dynamic question generation if trait is more complex
    try:
        prompt = f"Generate a yes/no question for a historical figure with the trait '{trait}' and value '{value}'."
        response = openai.ChatCompletion.create(
            model="gpt-3.5-turbo",
            messages=[
                {"role": "system",
                 "content": "You are an assistant that generates yes/no questions for a historical guessing game."},
                {"role": "user", "content": prompt}
            ]
        )
        return response['choices'][0]['message']['content'].strip()
    except openai.error.OpenAIError as e:
        print(f"Error generating question with GPT: {e}")
        # Fall back to a default question if GPT fails
        return f"Does this person's {trait} relate to {value}?"


def update_probability(answer, current_probability):
    """
    Update probability based on the user’s answer.
    """
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
