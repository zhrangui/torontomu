/*
	Fill in this block comment before submitting.
	Name: Rui Zhang
	No: 500536315
*/
#include <algorithm>
#include <vector>
using namespace std;

int knapsackBFRecursive(int weight, vector<pair<int, int>> &items, vector<pair<int, int>> &taken, int n)
{
	int bestValue = 0;
	if (n >= 0)
	{
		if (weight >= items[n].first)
		{
			int bestValuel = knapsackBFRecursive(weight, items, taken, n - 1);
			int bestValuer = knapsackBFRecursive(weight - items[n].first, items, taken, n - 1) + items[n].second;
			if (bestValuel >= bestValuer)
			{
				bestValue = bestValuel;
			}
			else
			{
				bestValue = bestValuer;
				taken.push_back(items[n]);
			}
		}
		else
		{
			bestValue = knapsackBFRecursive(weight, items, taken, n - 1);
		}
	}
	return bestValue;
}

int knapsackBF(int weight, vector<pair<int, int>> &items, vector<pair<int, int>> &taken)
{
	/************ BRUTE FORCE CODE HERE! ***************/
	// weight = maximum weight knapsack can hold
	// items  = vector of items to choose from
	// taken  = vector to hold chosen items
	/***************************************************/
	int len = items.size();
	int bestValue = knapsackBFRecursive(weight, items, taken, len);
	// best value should be the sum of all values in 'taken'
	return bestValue;
}

int knapsackDYN(int weight, vector<pair<int, int>> &items, vector<pair<int, int>> &taken)
{
	/******** DYNAMIC PROGRAMMING CODE HERE! ***********/
	// weight = maximum weight knapsack can hold
	// items  = vector of items to choose from
	// taken  = vector to hold chosen items
	/***************************************************/
	int bestValue = 0;
	int len = items.size();
	vector<vector<int>> ks;
	vector<vector<int>> direction;
	for (int k = 0; k < len; k++)
	{
		std::vector<int> row;
		std::vector<int> d;
		for (int w = 0; w <= weight; w++)
		{
			row.push_back(0);
			d.push_back(0);
		}
		ks.push_back(row);
		direction.push_back(d);
	}

	for (int k = 0; k < len; k++)
	{
		for (int w = 1; w <= weight; w++)
		{
			if (items[k].first > w)
			{
				ks[k][w] = k > 0 ? ks[k - 1][w] : 0;
			}
			else
			{
				int prev = k > 0 ? ks[k - 1][w] : 0;
				int curr = k > 0 ? ks[k - 1][w - items[k].first] + items[k].second : 0;
				if (prev >= curr)
				{
					ks[k][w] = prev;
					direction[k][w] = 0;
				}
				else
				{
					ks[k][w] = curr;
					direction[k][w] = 1;
				}
			}
		}
	}

	bestValue = ks[len - 1][weight];
	// best value should be the sum of all values in 'taken'
	int wght = weight;
	for (int k = len - 1; k >= 0; k--)
	{
		if (direction[k][wght] > 0)
		{
			taken.push_back(items[k]);
			wght -= items[k].first;
		}
	}
	std::reverse(taken.begin(), taken.end());
	return bestValue;
}