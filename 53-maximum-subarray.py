from typing import List


class Solution:
    """
    53. Maximum Subarray
    """

    def maxSubArray(self, nums: List[int]) -> int:
        max = nums[0]
        sum = 0
        for i, n in enumerate(nums):
            if sum < 0:
                sum = n
            else:
                sum += n
            if sum > max:
                max = sum
        return max


def test_solution():
    solution = Solution()
    assert solution.maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
    assert solution.maxSubArray([1]) == 1
    assert solution.maxSubArray([5, 4, -1, 7, 8]) == 23


if __name__ == '__main__':
    import pytest
    pytest.main([__file__])
