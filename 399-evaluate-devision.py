from typing import List

class Solution:
    """
    399. Evaluate Division
    """

    def find(self, start: str, end: str) -> float:
        edges = self.graph.get(start, {})
        if start in self.visited:
            return
        self.visited.add(start)
        for vert, value in edges.items():
            if vert == end:
                return value
            accum = self.find(vert, end)
            if accum is not None:
                return accum*value

    def calcOne(self, query: List[str]) -> float:
        self.visited = set()
        sum = self.find(query[0], query[1])
        return round(sum, 5) if sum else -1

    def calcEquation(self, equations: List[List[str]], values: List[float], queries: List[List[str]]) -> List[float]:
        self.graph = {}
        for i, eq in enumerate(equations):
            edges = self.graph.get(eq[0], {})
            weight = edges.get(eq[1], values[i])
            edges.update([(eq[1], weight)])
            self.graph.update([(eq[0], edges)])
            edges = self.graph.get(eq[1], {})
            weight = edges.get(eq[0], 1/values[i])
            edges.update([(eq[0], weight)])
            self.graph.update([(eq[1], edges)])

        result = list(map(self.calcOne, queries))
        return result


def test_solution():
    solution = Solution()
    assert solution.calcEquation([["a", "b"], ["b", "c"]], [2.0, 3.0], [["a", "c"], ["b", "a"], [
                                 "a", "e"], ["a", "a"], ["x", "x"]]) == [6.00000, 0.50000, -1.00000, 1.00000, -1.00000]
    assert solution.calcEquation([["a", "b"], ["b", "c"], ["bc", "cd"]], [1.5, 2.5, 5.0], [
                                 ["a", "c"], ["c", "b"], ["bc", "cd"], ["cd", "bc"]]) == [3.75000, 0.40000, 5.00000, 0.20000]
    assert solution.calcEquation([["a","b"]], [0.5], [["a","b"],["b","a"],["a","c"],["x","y"]]) == [0.50000,2.00000,-1.00000,-1.00000]

if __name__ == '__main__':
    import pytest
    pytest.main([__file__])
