# Leaf.py

class Leaf:
    """
    Represents a leaf node in the decision tree.
    Stores the predictions for the rows that reach this point.
    """
    def __init__(self, rows):
        if not rows:
            print("Warning: Leaf initialized with empty rows.")
        # Extract the names of the historical figures in the rows
        self.predictions = self.calculate_predictions(rows)

    def calculate_predictions(self, rows):
        """
        Calculate the distribution of historical figures in the rows.
        """
        prediction_counts = {}
        for row in rows:
            figure = row['HistoricalFigures']
            if figure in prediction_counts:
                prediction_counts[figure] += 1
            else:
                prediction_counts[figure] = 1
        return prediction_counts
