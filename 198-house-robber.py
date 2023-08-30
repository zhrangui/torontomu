from typing import List


class Solution:
    """
    198. House Robber
    """

    def __init__(self):
        self.memo = []

    def rob(self, nums: List[int]) -> int:
        length = len(nums)
        if length == 0:
            return 0
        if length < 3:
            return max(nums)
        elif len(self.memo) > length-3:
            return self.memo[length-3]
        else:
            current = max(self.rob(nums[:-2]) + nums[-1], self.rob(nums[:-1]))
        self.memo.append(current)
        return current


def test_solution():
    solution = Solution()
    assert solution.rob([1, 2, 3, 1]) == 4
    solution = Solution()
    assert solution.rob([2, 7, 9, 3, 1]) == 12


if __name__ == '__main__':
    import pytest
    pytest.main([__file__])
