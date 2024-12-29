# main.py
from Leaf import Leaf
from Tree import Tree
from utils import load_data, generate_question, update_probability
from probability import calculate_probabilities, get_next_question

def main():
    figures = load_data()  # Load figures from the database

    if not figures:
        print("No data available to build the decision tree!")
        return

    # Define the traits to use for questions
    traits = ["Gender", "Nationality", "BirthYear", "Achievements", "Spouses", "RealName", 'HistoricalFigures']

    questions_so_far = []
    answers_so_far = []

    while True:
        # Build the decision tree
        tree = Tree(figures, traits)
        decision_tree = tree.build_tree(figures)

        if isinstance(decision_tree, Leaf):
            # If at a leaf, display the predictions
            predictions = decision_tree.predictions
            if predictions:
                print("Guessing complete! Are you thinking of:")
                for figure, count in predictions.items():
                    print(f"- {figure} (Count: {count})")
            else:
                print("Guessing complete! No predictions available.")
            break

        # Get the next question to ask
        next_trait = get_next_question(traits, questions_so_far)

        if not next_trait:
            print("No more questions to ask!")
            break

        # Use the first figure's data as an example to generate the question
        example_value = figures[0][next_trait]
        question = generate_question(next_trait, example_value)
        print(question)

        # Record the question
        questions_so_far.append(next_trait)

        # Get the user's answer
        while True:
            answer = input("Answer (yes, probably yes, maybe, probably no, no): ").strip().lower()
            if answer in ['yes', 'probably yes', 'maybe', 'probably no', 'no']:
                break
            else:
                print("Invalid input! Please enter a valid response (yes, probably yes, maybe, probably no, no).")

        # Update probabilities
        answers_so_far.append(update_probability(answer, 0.5))

        # #Calculate probabilities
        # probabilities = calculate_probabilities(questions_so_far, answers_so_far, figures)
        # print("Updated probabilities:")
        # for prob in probabilities:
        #     print(f"{prob['name']}: {prob['probability']:.2f}")

if __name__ == "__main__":
    while True:
        main()
        new_game = input("Do you want to start a new game? (yes/no): ").strip().lower()
        if new_game != 'yes':
            break
