from typing import List


class Solution:
    """
    123. Best Time to Buy and Sell Stock III
    """

    def maxProfit(self, prices: List[int]) -> int:
        left, right = [], []
        low, high = 0, 0
        profit = 0
        for i, p in enumerate(prices):
            if i == 0:
                left.append(0)
                low = p
            else:
                sell = max(0, p-low)
                left.append(sell)
                if (low > p):
                    low = p

        for i, p in enumerate(prices[::-1]):
            if i == 0:
                buy = 0
                high = prices[-1]
                profit = left[-1]
            else:
                buy = max(buy, high-p)
                if left[-1-i] + buy > profit:
                    profit = left[-1-i] + buy
                if (high < p):
                    high = p

        return profit


def test_solution():
    solution = Solution()
    assert solution.maxProfit([3, 3, 5, 0, 0, 3, 1, 4]) == 6
    assert solution.maxProfit([1, 2, 3, 4, 5]) == 4
    assert solution.maxProfit([7, 6, 4, 3, 1]) == 0


if __name__ == '__main__':
    import pytest
    pytest.main([__file__])
