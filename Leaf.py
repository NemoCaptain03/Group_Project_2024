class Leaf:
    def __init__(self, rows):
        self.predictions = [row['HistoricalFigures'] for row in rows]  # Store the names of the figures in this leaf
