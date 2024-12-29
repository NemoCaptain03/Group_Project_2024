
import numpy as np

def calculate_figure_probability(figure, questions_so_far, answers_so_far, figures):
    """
    Calculate the probability of a specific figure being correct given the questions and answers so far.
    """
    # Prior Probability: Equal for all figures initially
    p_figure = 1 / len(figures)

    # Likelihood: How likely the figure's answers match the user's answers
    p_answers_given_figure = 1

    for question, answer in zip(questions_so_far, answers_so_far):
        figure_ans = figure_answer(figure, question)
        if isinstance(figure_ans, (int, float)):
            # Match probability adjustment based on the similarity of answer and figure's value
            match = 1 - abs(answer - figure_ans)
            p_answers_given_figure *= max(match, 0.01)  # Avoid zero probability

    return p_answers_given_figure * p_figure




def figure_answer(figure, question):
    """
    Retrieve the figure's answer for a specific question.
    Normalize values for comparison depending on the question type.
    """
    value = figure.get(question, None)

    if question == "Gender":
        # Normalize gender comparison (Female = 1.0, Male = 0.0)
        return 1.0 if value.lower() == "female" else 0.0

    elif question == "RealName":
        # Compare the exact name
        return 1.0 if value.lower() == "yes" else 0.0

    elif question == "Nationality":
        # Compare nationalities
        return 1.0 if value.lower() == "dai viet" else 0.0

    elif question == "BirthYear":
        # Compare year as a numeric field
        try:
            return float(value)
        except (TypeError, ValueError):
            return 0.5  # Neutral if BirthYear is invalid or not available

    elif question == "Achievements":
        # Check if the achievement matches (normalize to binary)
        return 1.0 if "achievement" in value.lower() else 0.0

    elif question == "Spouses":
        # Check if the spouse matches
        return 1.0 if "spouse" in value.lower() else 0.0

    # Default fallback for unsupported fields
    try:
        return float(value)
    except (TypeError, ValueError):
        return 0.5




def calculate_probabilities(questions_so_far, answers_so_far, figures):
    """
    Calculate probabilities for all figures based on user input.
    """
    probabilities = []

    for figure in figures:
        probability = calculate_figure_probability(figure, questions_so_far, answers_so_far, figures)
        probabilities.append({
            'name': figure['HistoricalFigures'],
            'probability': probability
        })

    probabilities = sorted(probabilities, key=lambda x: x['probability'], reverse=True)
    return probabilities

def get_next_question(questions, questions_so_far):
    """
    Return the next question that has not been asked yet.
    """
    for question in questions:
        if question not in questions_so_far:
            return question
    return None
