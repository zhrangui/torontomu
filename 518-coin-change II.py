from typing import List


class Solution:
    """
    518. Coin Change II
    """

    def change(self, amount: int, coins: List[int]) -> int:
        if len(coins) == 1:
            return 1 if amount % coins[0] == 0 else 0
        else:
            count = 0
            last = 1
            while coins[-1] * last <= amount:
                count += self.change(amount - coins[-1]*last, coins[:-1])
                last += 1
            count += self.change(amount, coins[:-1])
        return count


def test_solution():
    solution = Solution()
    assert solution.change(5, [1, 2, 5]) == 4
    assert solution.change(3, [2]) == 0
    assert solution.change(10, [10]) == 1


if __name__ == '__main__':
    import pytest
    pytest.main([__file__])
