# Tree.py

from Leaf import Leaf

class DecisionNode:
    """
    Represents a decision node in the tree.
    Contains a question and two branches: true_branch and false_branch.
    """
    def __init__(self, question, true_branch, false_branch):
        self.question = question
        self.true_branch = true_branch
        self.false_branch = false_branch

class Tree:
    def __init__(self, dataset, headers):
        self.dataset = dataset
        self.headers = headers

    def build_tree(self, rows):
        """
        Recursively builds the decision tree.
        """
        gain, question = self.find_best_split(rows)

        # If no information gain, return a leaf
        if gain == 0 or not rows:
            return Leaf(rows)

        # Partition the dataset
        true_rows, false_rows = self.partition(rows, question)

        # Recursively build the true and false branches
        true_branch = self.build_tree(true_rows)
        false_branch = self.build_tree(false_rows)

        # Return a decision node
        return DecisionNode(question, true_branch, false_branch)

    def find_best_split(self, rows):
        """
        Finds the best question to split the data.
        """
        best_gain = 0  # Keep track of the best information gain
        best_question = None  # Keep track of the best question
        current_uncertainty = self.gini(rows)

        for col in self.headers:
            values = set([row[col] for row in rows if row[col] is not None])

            for val in values:
                question = (col, val)
                true_rows, false_rows = self.partition(rows, question)

                # Skip if no split
                if not true_rows or not false_rows:
                    continue

                # Calculate the information gain
                gain = self.info_gain(true_rows, false_rows, current_uncertainty)

                # Update best gain and question if found better
                if gain > best_gain:
                    best_gain, best_question = gain, question

        return best_gain, best_question

    def partition(self, rows, question):
        """
        Partition the dataset based on the question.
        """
        true_rows, false_rows = [], []
        column, value = question

        for row in rows:
            if row[column] == value:
                true_rows.append(row)
            else:
                false_rows.append(row)

        return true_rows, false_rows

    def gini(self, rows):
        """
        Calculate the Gini Impurity for a list of rows.
        """
        counts = self.class_counts(rows)
        impurity = 1
        total = len(rows)

        for label in counts:
            prob_of_lbl = counts[label] / total
            impurity -= prob_of_lbl ** 2

        return impurity

    def info_gain(self, left, right, current_uncertainty):
        """
        Calculate the Information Gain.
        """
        p = float(len(left)) / (len(left) + len(right))
        return current_uncertainty - p * self.gini(left) - (1 - p) * self.gini(right)

    def class_counts(self, rows):
        """
        Count the number of each type of example in a dataset.
        """
        counts = {}
        for row in rows:
            label = row['HistoricalFigures']
            if label not in counts:
                counts[label] = 0
            counts[label] += 1
        return counts
