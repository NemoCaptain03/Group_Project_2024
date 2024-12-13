from Leaf import Leaf
from Tree import *
from utils import *
from probability import *


def main():
    categories = create_categories()
    figures = load_data()  # Load figures directly, no need for countries_answers

    questions_dict = {}
    questions_so_far = []
    answers_so_far = []

    while True:
        # Build the decision tree
        t = Tree(figures, ["Gender", "RealName", "Nationality", "BirthYear", "Achievements", "Spouses"])
        my_tree = t.build_tree(figures)

        if isinstance(my_tree, Leaf):
            print("Guessing complete!")
            break

        # Get question based on simple traits or complex traits
        question = generate_simple_question("Gender", "Female")  # Example for simple question
        print(question)

        answer = input("Answer: ")
        answers_so_far.append(update_probability(answer, 0.5))  # Placeholder answer update

        # Continue with tree logic for splitting, etc.
        # You can also ask complex questions here if needed

        # Example decision-making process continues...
        # You can replace the above simple question with complex ones as needed


if __name__ == "__main__":
    while True:
        main()
        print('Do you want to start a new game?')
        new_game = input()
        if new_game.lower() != 'yes':
            break
