from Leaf import Leaf
from Tree import *
from utils import *
from probability import *


def main():
    # Step 1: Create categories and load figures
    categories = create_categories()  # This can categorize the questions based on the dataset
    figures = load_data()  # Load all figures from your database

    questions_dict = {}  # A dictionary to store questions
    questions_so_far = []  # A list of questions asked so far
    answers_so_far = []  # A list of answers given so far

    while True:
        # Step 2: Build the decision tree using the figures data
        t = Tree(figures, ["Gender", "RealName", "Nationality", "BirthYear", "Achievements", "Spouses"])
        my_tree = t.build_tree(figures)

        if isinstance(my_tree, Leaf):  # If the tree is a leaf node, it means we've guessed the figure
            print("Guessing complete!")
            # Ask for confirmation from the user
            confirm_answer(my_tree.predictions, answers_so_far, questions_so_far, len(figures[0]) - 1, figures, True)
            break

        # Step 3: Get the question based on simple traits or complex traits
        # You can modify this part to dynamically choose between simple or complex questions
        question = generate_simple_question("Gender", "Female")  # Example for simple question
        print(question)

        # Step 4: Get the answer from the user and process it
        answer = input("Answer (yes, probably yes, maybe, probably no, no): ").strip().lower()
        while answer not in ['yes', 'probably yes', 'maybe', 'probably no', 'no']:
            print("Invalid answer, please answer with 'yes', 'probably yes', 'maybe', 'probably no', or 'no'.")
            answer = input("Answer (yes, probably yes, maybe, probably no, no): ").strip().lower()

        # Step 5: Update the answers and store the answer
        answers_so_far.append(update_probability(answer, 0.5))  # Placeholder answer update (0.5 is neutral)
        questions_so_far.append(question)

        # Step 6: Calculate probabilities of each figure based on the current answers
        figures_probabilities = calculate_probabilities(questions_so_far, answers_so_far, figures)
        result = sorted(figures_probabilities, key=lambda p: p['probability'], reverse=True)
        print("Probabilities: ", result)

        # Step 7: Confirm if the game is confident enough to make a guess
        if check_prob(result) or len(questions_so_far) >= 15:
            if confirm_answer(result, answers_so_far, questions_so_far, len(figures[0]) - 1, figures, False):
                break

        # Step 8: Update the figures, questions and answers to narrow down the possibilities
        if answer == 'yes' or answer == 'probably yes':
            category = find_category(categories, question)
            # Update the possible questions based on the answer
            figures_questions = update_questions(figures, categories[category])
            delete_category(figures, category, categories, t.headers)
        else:
            delete_question(figures, question, categories)


if __name__ == "__main__":
    while True:
        main()
        print('Do you want to start a new game? (yes/no)')
        new_game = input().strip().lower()
        if new_game == 'no':
            break
