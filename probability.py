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
        p_answers_given_figure *= max(1 - abs(answer - figure_answer(figure, question)), 0.01)

        # Likelihood that another figure's answer matches the user's
        p_answer_not_figure = np.mean([1 - abs(answer - figure_answer(not_figure, question))
                                       for not_figure in figures
                                       if not_figure['name'] != figure['name']])
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
    if 'answers' in figure and question in figure['answers']:
        return figure['answers'][question]
    return 0.5  # Default value if no answer is found



def calculate_probabilities(questions_so_far, answers_so_far, figures):
    probabilities = []

    # For each figure in the database, calculate its probability based on the user's answers
    for figure in figures:
        probability = calculate_figure_probability(figure, questions_so_far, answers_so_far, figures)
        probabilities.append({
            'name': figure['HistoricalFigures'],  # Name of the figure
            'probability': probability  # Probability of the figure being the answer
        })

    return probabilities
