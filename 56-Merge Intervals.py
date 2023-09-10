from typing import List


class Solution:
    """
    56. Merge Intervals

    """

    def merge(self, intervals: List[List[int]]) -> List[List[int]]:
        intervals.sort()
        result = intervals[0:1]
        for l in intervals[1:]:
            if result[-1][1] >= l[0]:
                result[-1][1] = max(result[-1][1], l[1])
            else:
                result.append(l)

        return result


def test_solution():
    solution = Solution()
    assert solution.merge([[1, 3], [2, 6], [8, 10], [15, 18]]) == [
        [1, 6], [8, 10], [15, 18]]
    assert solution.merge([[1, 4], [4, 5]]) == [[1, 5]]


if __name__ == '__main__':
    import pytest
    pytest.main([__file__])
