from utils import load_data, generate_question


class Question:
    def __init__(self, text, trait, value):
        self.text = text
        self.trait = trait
        self.value = value

    def __str__(self):
        return self.text


def getQuestion(trait, value):
    question_text = generate_question(trait, value)
    return Question(question_text, trait, value)


def game_simulation():
    figures = load_data()

    game_count = 1
    game_data = []
    for figure in figures:
        game_questions = []

        traits = ['Gender', 'Nationality', 'Achievements', 'BirthYear', 'Spouses']
        for trait in traits:
            value = figure[trait]
            questions = generate_question(trait, value)

            if isinstance(questions, list):
                for question in questions:
                    game_questions.append({"question": str(question), "trait": trait, "value": value})
            else:
                game_questions.append({"question": questions, "trait": trait, "value": value})

        game_data.append({
            "game_number": game_count,
            "questions": game_questions,
            "guess": f"Is this person {figure['HistoricalFigures']}?"
        })

        game_count += 1

    return game_data
