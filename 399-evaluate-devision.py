from typing import List


class Solution:
    """
    399. Evaluate Division
    """

    def calcEquation(self, equations: List[List[str]], values: List[float], queries: List[List[str]]) -> List[float]:
        def calcOne(query: List[str]) -> float:
            num_p = None
            den_p = None
            num_n = None
            den_n = None
            for i, eq in enumerate(equations):
                if eq[0] == query[0]:
                    num_p = i
                    if den_p is not None:
                        break
                if eq[1] == query[1]:
                    den_p = i
                    if num_p is not None:
                        break
                if eq[1] == query[0]:
                    num_n = i
                    if den_n is not None:
                        break
                if eq[0] == query[1]:
                    den_n = i
                    if num_n is not None:
                        break
            multiply = 1.0
            if (num_p is not None) and (den_p is not None):
                for v in values[num_p:den_p+1]:
                    multiply *= v
                return multiply

            if (num_n is not None) and (den_n is not None):
                for v in values[den_n:num_n+1]:
                    multiply *= v
                return 1.0/multiply

            if ((num_p is not None) or (den_p is not None) or (num_n is not None) or (den_n is not None)) and (query[0] == query[1]):
                return 1.0
            return -1.0

        result = list(map(calcOne, queries))

        return result


def test_solution():
    solution = Solution()
    # assert solution.calcEquation([["a", "b"], ["b", "c"]], [2.0, 3.0], [["a", "c"], ["b", "a"], [
    #                              "a", "e"], ["a", "a"], ["x", "x"]]) == [6.00000, 0.50000, -1.00000, 1.00000, -1.00000]

    # assert solution.calcEquation([["a", "b"], ["b", "c"], ["bc", "cd"]], [1.5, 2.5, 5.0], [
    #                              ["a", "c"], ["c", "b"], ["bc", "cd"], ["cd", "bc"]]) == [3.75000, 0.40000, 5.00000, 0.20000]

    assert solution.calcEquation([["a","e"],["b","e"]], [4.0,3.0], [["a","b"],["e","e"],["x","x"]]) == [1.33333,1.00000,-1.00000]


if __name__ == '__main__':
    import pytest
    pytest.main([__file__])
