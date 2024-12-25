from Leaf import Leaf
from Tree import *
from utils import *
from probability import *


def refine_question_based_on_response(response, last_question):
    """Generate a follow-up question based on the user's last response."""
    if "literary contributions" in last_question:
        if response in ['yes', 'probably yes']:
            return "Was this person known for revolutionary acts tied to their literature?"
        else:
            return "Is this person associated with Vietnamese royalty or leadership?"
    return "Can you tell me more about their achievements or role?"


def main():
    print("Welcome to Huntoric!")

    # Load data from the database
    figures = load_data()  # Load historical figures

    if not figures:
        print("No data available. Please add historical figures to the database first.")
        return

    # Define categories and initialize game variables
    categories = create_categories()
    questions_so_far = []
    answers_so_far = []

    while True:
        # Build the decision tree based on current figures
        tree_builder = Tree(figures, ["Gender", "RealName", "Nationality", "BirthYear", "Achievements", "Spouses"])
        decision_tree = tree_builder.build_tree(figures)

        if isinstance(decision_tree, Leaf):
            # If the tree is reduced to a single leaf, guess the figure
            possible_figures = decision_tree.predictions
            if len(possible_figures) == 1:
                print(f"I am confident you are thinking of {possible_figures[0]}.")
            else:
                print("I am not sure, but you might be thinking of one of these:")
                for figure in possible_figures:
                    print(f"- {figure}")
            break

        # Get the question from the decision tree
        question_column, question_value = decision_tree.question
        question = generate_question(question_column, question_value, "A historical figure")
        print(f"Question: {question}")

        # Get user input
        answer = input("Answer (yes, probably yes, maybe, probably no, no): ").lower()
        probability = update_probability(answer, 0.5)

        # Update questions and answers history
        questions_so_far.append(question_column)
        answers_so_far.append(probability)

        # Ask more questions before guessing
        if len(questions_so_far) < 3:
            print("Let me ask a few more questions to narrow down.")
            continue

        # Partition the figures based on the answer
        figures = update_figures_based_on_answer(figures, categories, question_column, answer)

        # Check if probabilities allow for a confident guess
        probabilities = calculate_probabilities(questions_so_far, answers_so_far, figures)
        if check_prob(probabilities):
            confirm = confirm_answer(probabilities, questions_so_far, answers_so_far, figures)
            if confirm:
                break

        # Generate follow-up question dynamically
        question = refine_question_based_on_response(answer, question)
        print(f"Follow-up Question: {question}")

        # If figures are reduced significantly, ask for confirmation
        delete_invalid_figures(probabilities, figures)

        # If figures are completely eliminated, ask the user to add a new figure
        if not figures:
            print("I couldn't guess the figure. Let me add it to my database.")
            add_new_figure(questions_so_far, answers_so_far, figures)
            break


if __name__ == "__main__":
    while True:
        main()
        print("Do you want to start a new game? (yes/no)")
        new_game = input()
        if new_game.lower() != 'yes':
            print("Thank you for playing! Goodbye!")
            break
