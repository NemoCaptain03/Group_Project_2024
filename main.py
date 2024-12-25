from Leaf import Leaf
from Tree import *
from utils import *
from probability import *
from utils import create_categories
from utils import update_probability




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

        # Lấy thuộc tính tiếp theo chưa được hỏi
        trait_to_ask = get_next_question(["Gender", "RealName", "Nationality", "BirthYear", "Achievements", "Spouses"],
                                         questions_so_far)

        if trait_to_ask:
            # Lấy giá trị thực tế từ nhân vật đầu tiên trong danh sách figures
            trait_value = get_trait_value(trait_to_ask, figures[0])  # figures[0] là ví dụ, bạn có thể tùy chỉnh
            if trait_value == "Unknown" or not trait_value:
                print(f"Không thể tìm thấy thông tin cho thuộc tính {trait_to_ask}.")
                continue

            # Tạo câu hỏi bằng GPT từ utils.py
            question = generate_question(trait_to_ask, trait_value, "Historical Figure")

            print(question)

            # Lưu lại câu hỏi đã hỏi để tránh trùng lặp
            questions_so_far.append(trait_to_ask)
        else:
            print("Không còn câu hỏi nào để hỏi!")
            break

        while True:
            answer = input("Answer (yes, probably yes, maybe, probably no, no): ").strip().lower()
            if answer in ['yes', 'probably yes', 'maybe', 'probably no', 'no']:
                break
            else:
                print("Invalid input! Please enter a valid response (yes, probably yes, maybe, probably no, no).")

        answers_so_far.append(update_probability(answer, 0.5))

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
