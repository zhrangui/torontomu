from typing import List


class Solution:
    """
    52. N-Queens II
    """

    def totalNQueens(self, n: int) -> int:
       for i in range(n):
         
           
        total = self.totalNQueens(n - 1) + n - 1
        return total


def test_solution():
    solution = Solution()
    assert solution.totalNQueens(4) == 2
    assert solution.totalNQueens(1) == 1


if __name__ == '__main__':
    import pytest
    pytest.main([__file__])
