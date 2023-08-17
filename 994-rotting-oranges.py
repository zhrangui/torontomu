from typing import List


class Solution:
    """
    994. Rotting Oranges
    """

    def orangesRotting(self, grid: List[List[int]]) -> int:
        m = len(grid)
        n = len(grid[0])
        visited = []
        time = 0
        is_rotted = True
        while is_rotted:
            rotted = [] 
            is_rotted = False
            for i in range(m):
                for j in range(n):
                    if (i, j) in visited:
                        continue
                    if grid[i][j] == 2:
                        if i > 0 and grid[i-1][j] == 1:
                            rotted.append((i-1, j))
                        if i < m-1 and grid[i+1][j] == 1:
                            rotted.append((i+1, j))
                        if j > 0 and grid[i][j-1] == 1:
                            rotted.append((i, j-1))
                        if j < n-1 and grid[i][j+1] == 1:
                            rotted.append((i, j+1))
                        visited.append((i, j))
            if rotted:
                is_rotted = True
                for r in rotted:
                    grid[r[0]][r[1]] = 2
                time += 1

        for i in range(m):
            for j in range(n):
                if grid[i][j] == 1:
                    return -1

        return time

def test_solution():
    solution = Solution()
    assert solution.orangesRotting([[2,1,1],[1,1,0],[0,1,1]]) == 4
    assert solution.orangesRotting([[2,1,1],[0,1,1],[1,0,1]]) == -1
    assert solution.orangesRotting([[0,2]]) == 0


if __name__ == '__main__':
    import pytest
    pytest.main([__file__])
