from Leaf import Leaf
from Tree import *
from utils import *
from probability import *
from transformers import pipeline

# Tải pipeline từ Hugging Face để sử dụng GPT-2 hoặc GPT-Neo cho việc tạo câu hỏi
generator = pipeline("text-generation", model="gpt2")

def generate_dynamic_question(trait_type, trait_value, figure_name):
    """
    Sử dụng Hugging Face GPT để tạo câu hỏi động dựa trên đặc điểm của nhân vật.
    """
    prompt = f"Generate a yes/no question based on the following trait: {trait_type} = {trait_value}. " \
             f"The figure is {figure_name}. Example: Was this person notable for {trait_value}?"

    # Gọi pipeline để tạo câu hỏi
    try:
        result = generator(prompt, max_length=50, num_return_sequences=1)
        question = result[0]['generated_text'].strip()
        return question
    except Exception as e:
        print(f"Error generating question: {e}")
        return f"Is this person's {trait_type} related to {trait_value}?"

def main():
    categories = create_categories()
    figures = load_data()  # Load figures directly

    questions_so_far = []
    answers_so_far = []

    while True:
        # Xây dựng cây quyết định
        t = Tree(figures, ["Gender", "RealName", "Nationality", "BirthYear", "Achievements", "Spouses"])
        my_tree = t.build_tree(figures)

        # Nếu cây quyết định không phải là Leaf, thì hỏi câu hỏi động
        if isinstance(my_tree, Leaf):
            print("Guessing complete!")
            break  # Kết thúc vòng lặp khi có lá (leaf)

        # Hỏi câu hỏi động dựa trên các trait
        for trait in ["Gender", "Achievements", "Spouses", "Nationality"]:
            # Lấy giá trị của trait từ nhân vật đầu tiên làm ví dụ
            trait_value = figures[0].get(trait, "unknown")
            figure_name = figures[0].get("HistoricalFigures", "the figure")

            # Tạo câu hỏi động
            question = generate_dynamic_question(trait, trait_value, figure_name)
            print(question)

            # Nhận câu trả lời từ người dùng
            answer = input("Answer (yes/no/maybe): ").lower()
            questions_so_far.append(question)
            answers_so_far.append(update_probability(answer, 0.5))  # Placeholder answer update

        # Tiếp tục logic của decision tree
        print("Analyzing answers and updating tree...")

if __name__ == "__main__":
    while True:
        main()
        print('Do you want to start a new game? (yes/no)')
        new_game = input()
        if new_game.lower() != 'yes':
            break
