from typing import List


class Solution:
    """
    399. Evaluate Division
    """

    def calcEquation(self, equations: List[List[str]], values: List[float], queries: List[List[str]]) -> List[float]:
        def calcOne(query: List[str]) -> float:
            isExist = False
            for i, eq in enumerate(equations):
                if eq[0] in query or eq[1] in query:
                    isExist = True

                # if eq[1] == query[0] or eq[1] == query[1]:
                #     isExist = True
                #     assembly = [eq[1], eq[1]]
                # if assembly:
                for j, factor in enumerate(equations[i:]):
                    if j == 0:
                        assembly = eq[::]
                        multiplication = values[i]
                    else:
                        if assembly[0] == factor[0]:
                            assembly[0] = factor[1]
                            multiplication /= values[i+j]
                        elif assembly[0] == factor[1]:
                            assembly[0] = factor[0]
                            multiplication *= values[i+j]
                        elif assembly[1] == factor[0]:
                            assembly[1] = factor[1]
                            multiplication *= values[i+j]
                        elif assembly[1] == factor[1]:
                            assembly[1] = factor[0]
                            multiplication /= values[i+j]
                    if assembly == query:
                        return round(multiplication, 5)
                    elif assembly[::-1] == query:
                        return round(1.0/multiplication, 5)

            if (query[0] == query[1]) and isExist:
                return 1.0
            return -1.0

        result = list(map(calcOne, queries))
        return result


def test_solution():
    solution = Solution()
    assert solution.calcEquation([["a", "b"], ["b", "c"]], [2.0, 3.0], [["a", "c"], ["b", "a"], [
                                 "a", "e"], ["a", "a"], ["x", "x"]]) == [6.00000, 0.50000, -1.00000, 1.00000, -1.00000]

    assert solution.calcEquation([["a", "b"], ["b", "c"], ["bc", "cd"]], [1.5, 2.5, 5.0], [
                                 ["a", "c"], ["c", "b"], ["bc", "cd"], ["cd", "bc"]]) == [3.75000, 0.40000, 5.00000, 0.20000]

    assert solution.calcEquation([["a", "b"], ["e", "f"], ["b", "e"]], [3.4, 1.4, 2.3], [["b", "a"], ["a", "f"], ["f", "f"], [
                                 "e", "e"], ["c", "c"], ["a", "c"], ["f", "e"]]) == [0.29412, 10.94800, 1.00000, 1.00000, -1.00000, -1.00000, 0.71429]


if __name__ == '__main__':
    import pytest
    pytest.main([__file__])
