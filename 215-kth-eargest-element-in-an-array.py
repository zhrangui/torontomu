from typing import List


class Solution:
    """
    215. Kth Largest Element in an Array

    """

    def findKthLargest(self, nums: List[int], k: int) -> int:
        s_nums = sorted(nums)
        return s_nums[-k]


def test_solution():
    solution = Solution()
    assert solution.findKthLargest([3, 2, 1, 5, 6, 4], 2) == 5
    assert solution.findKthLargest([3, 2, 3, 1, 2, 4, 5, 5, 6], 4) == 4


if __name__ == '__main__':
    import pytest
    pytest.main([__file__])
