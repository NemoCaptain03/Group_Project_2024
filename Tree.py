from DecisionNode import DecisionNode
from Leaf import Leaf


class Tree:
    def __init__(self, dataset, headers):
        self.dataset = dataset
        self.headers = headers

    def build_tree(self, rows):
        """Recursively builds the decision tree."""
        gain, question = self.find_best_split(rows)

        if gain == 0:
            return Leaf(rows)  # No gain, so we reach a leaf

        true_rows, false_rows = self.partition(rows, question)

        true_branch = self.build_tree(true_rows)
        false_branch = self.build_tree(false_rows)

        return DecisionNode(question, true_branch, false_branch)

    def find_best_split(self, rows):
        """Finds the best question to split the data."""
        best_gain = 0
        best_question = None
        current_uncertainty = self.gini(rows)
        n_features = len(self.headers)  # Use headers to determine the number of features

        for col in self.headers:
            values = set([row[col] for row in rows if row[col] is not None])  # Avoid None values
            for val in values:
                question = (col, val)  # Use the column name and value as a tuple
                true_rows, false_rows = self.partition(rows, question)

                if len(true_rows) == 0 or len(false_rows) == 0:
                    continue

                gain = self.info_gain(true_rows, false_rows, current_uncertainty)

                if gain >= best_gain:
                    best_gain, best_question = gain, question

        return best_gain, best_question

    def partition(self, rows, question):
        """Partitions the dataset based on the question."""
        true_rows, false_rows = [], []
        column, value = question  # Unpack the column and value from the question

        for row in rows:
            val = row[column]  # Get the value from the row using the column name
            if val == value:
                true_rows.append(row)
            else:
                false_rows.append(row)
        return true_rows, false_rows

    def gini(self, rows):
        """Calculates the Gini impurity for the given rows."""
        counts = self.figure_names(rows)
        impurity = 1
        for _ in counts:
            prob_of_lbl = 1 / float(len(rows))
            impurity -= prob_of_lbl ** 2
        return impurity

    def info_gain(self, left, right, current_uncertainty):
        """Calculates the information gain from a split."""
        p = float(len(left)) / (len(left) + len(right))
        return current_uncertainty - p * self.gini(left) - (1 - p) * self.gini(right)

    def figure_names(self, rows):
        """Extract the names of the figures in the rows."""
        return [row['HistoricalFigures'] for row in rows]