import numpy as np


def calculate_figure_probability(figure, questions_so_far, answers_so_far, figures):
    # Prior Probability: Equal for all figures initially
    p_figure = 1 / len(figures)

    # Likelihood: How likely the figure's answers match the user's answers
    p_answers_given_figure = 1
    p_answers_given_not_figure = 1

    # Loop through each question and answer to calculate the likelihood
    for question, answer in zip(questions_so_far, answers_so_far):
        # Likelihood that the figure's answer matches the user's
        figure_ans = figure_answer(figure, question)
        p_answers_given_figure *= max(1 - abs(answer - figure_ans), 0.01)

        # Likelihood that another figure's answer matches the user's
        not_figure_answers = [
            1 - abs(answer - figure_answer(not_figure, question)) if figure_answer(not_figure,
                                                                                   question) is not None else 0.5
            for not_figure in figures if not_figure['figures_name'] != figure['figures_name']
        ]
        if not_figure_answers:
            p_answer_not_figure = np.mean(not_figure_answers)
        else:
            p_answer_not_figure = 0.5
        p_answers_given_not_figure *= max(p_answer_not_figure, 0.01)

    # Evidence: Probability of the answers given (normalizing factor)
    p_answers = p_figure * p_answers_given_figure + (1 - p_figure) * p_answers_given_not_figure

    # Bayes' Theorem: Update the figure's probability based on user answers
    p_figure_given_answers = (p_answers_given_figure * p_figure) / p_answers

    return p_figure_given_answers


def figure_answer(figure, question):
    """
    Given a figure, return the answer to the specified question.
    If the answer is not found, default to 0.5 (neutral answer).
    """
    return figure['answers'].get(question, 0.5)


def calculate_probabilities(questions_so_far, answers_so_far, figures):
    probabilities = []

    # For each figure in the database, calculate its probability based on the user's answers
    for figure in figures:
        probability = calculate_figure_probability(figure, questions_so_far, answers_so_far, figures)
        probabilities.append({
            'name': figure['figures_name'],  # Name of the figure
            'probability': probability  # Probability of the figure being the answer
        })

    # Sort probabilities to get the most likely figure first
    probabilities = sorted(probabilities, key=lambda x: x['probability'], reverse=True)

    # Remove figures with very low probability (noise filtering)
    probabilities = [p for p in probabilities if p['probability'] > 0.01]

    return probabilities


def get_next_question(questions, questions_so_far):
    """
    Return the next question that has not been asked yet.
    """
    for question in questions:
        if question not in questions_so_far:
            return question
    return None  # If no more questions available


def ask_next_question(probabilities, questions, questions_so_far, answers_so_far, figures):
    """
    Handle asking the next question and updating the probabilities and figure list.
    """
    # Check if a figure has a high enough probability
    if probabilities and probabilities[0]['probability'] >= 0.7:
        print(f"Are you thinking about {probabilities[0]['name']}?")
        response = input("Answer (yes/no): ").strip().lower()
        if response == "yes":
            print("Great! I guessed it!")
            return True, figures
        else:
            # Remove the figure with the highest probability
            figures = [f for f in figures if f['figures_name'] != probabilities[0]['figures_name']]

    # Ask the next question
    current_question = get_next_question(questions, questions_so_far)
    if not current_question:
        print("I ran out of questions!")
        return True, figures

    print(current_question)
    user_answer = float(input("Answer (0 to 1): ").strip())
    questions_so_far.append(current_question)
    answers_so_far.append(user_answer)

    return False, figures


def historical_figures(figures, questions):
    questions_so_far = []
    answers_so_far = []

    while True:
        probabilities = calculate_probabilities(questions_so_far, answers_so_far, figures)

        # Ask the next question or make a guess
        finished, figures = ask_next_question(probabilities, questions, questions_so_far, answers_so_far, figures)

        if finished:
            break
