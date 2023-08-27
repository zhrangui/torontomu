from typing import List


class Solution:
    """
    518. Coin Change II
    """

    def change(self, amount: int, coins: List[int]) -> int:
        dp = [0] * (amount + 1)
        dp[0] = 1
        for coin in coins:
            for j in range(coin, amount + 1):
                dp[j] += dp[j-coin]
        return dp[amount]


def test_solution():
    solution = Solution()
    assert solution.change(5, [1, 2, 5]) == 4
    assert solution.change(3, [2]) == 0
    assert solution.change(10, [10]) == 1


if __name__ == '__main__':
    import pytest
    pytest.main([__file__])
