# app.py
from flask import Flask, jsonify
from main import game_simulation

app = Flask(__name__)


@app.route('/')
def home():
    return "Welcome to the Historical Figures Game!"


@app.route('/start_game', methods=['GET'])
def start_game():
    """
    Start a game by generating a series of questions.
    Returns a JSON response containing the game data.
    """
    # Call the game_simulation function from main.py
    game_data = game_simulation()

    # Return the game data as a JSON response
    return jsonify(game_data)


if __name__ == "__main__":
    app.run(debug=True)
