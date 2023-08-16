class Solution:
    """
    790. Domino and Tromino Tiling
    """

    memo = {1: 1, 2: 2, 3: 5}

    def numTilings(self, n: int) -> int:
        recur = self.memo.get(n)
        if recur is not None:
            return recur
        recur_1 = self.numTilings(n-1)
        recur_3 = self.numTilings(n-3)
        recur = (recur_1*2 + recur_3) % (10**9 + 7)
        self.memo[n] = recur
        return recur


def test_solution():
    solution = Solution()
    assert solution.numTilings(3) == 5


if __name__ == '__main__':
    import pytest
    pytest.main([__file__])
