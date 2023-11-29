/*
    Fill in this block comment before submitting.
    Name: Rui Zhang
    No: 500536315
*/
#include <algorithm>
#include <vector>
using namespace std;

void knapsackBFBruteForce(int weight, vector<pair<int, int>> &items, vector<bool> &selected, vector<bool> &maxSelected, int &maxValue, int index = 0)
{
    int len = items.size();
    int totalWeight = 0;
    int value = 0;
    if (index == len)
    {
        for (int i = 0; i < len; i++)
        {
            if (selected[i])
            {
                totalWeight += items[i].first;
                value += items[i].second;
            }
        }
        if (totalWeight <= weight && value > maxValue)
        {
            maxValue = value;
            maxSelected = selected;
        }
        return;
    }
    selected[index] = true;
    knapsackBFBruteForce(weight, items, selected, maxSelected, maxValue, index + 1);
    selected[index] = false;
    knapsackBFBruteForce(weight, items, selected, maxSelected, maxValue, index + 1);
}

int knapsackBF(int weight, vector<pair<int, int>> &items, vector<pair<int, int>> &taken)
{
    /************ BRUTE FORCE CODE HERE! ***************/
    // weight = maximum weight knapsack can hold
    // items  = vector of items to choose from
    // taken  = vector to hold chosen items
    /***************************************************/
    int len = items.size();
    vector<bool> selected = vector<bool>(len, false);
    vector<bool> maxSelected = selected;
    int bestValue = 0;
    knapsackBFBruteForce(weight, items, selected, maxSelected, bestValue);

    // best value should be the sum of all values in 'taken'
    for (int i = 0; i < maxSelected.size(); i++)
    {
        if (maxSelected[i])
        {
            taken.push_back(items[i]);
        }
    }
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

    // std::sort(sortedItems.begin(), sortedItems.end());
    for (int k = 0; k < len; k++)
    {
        std::vector<int> row;
        for (int w = 0; w <= weight; w++)
        {
            row.push_back(0);
        }
        ks.push_back(row);
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
                int curr = k > 0 ? ks[k - 1][w - items[k].first] + items[k].second : items[k].second;
                if (prev >= curr)
                {
                    ks[k][w] = prev;
                }
                else
                {
                    ks[k][w] = curr;
                }
            }
        }
    }

    bestValue = ks[len - 1][weight];
    // best value should be the sum of all values in 'taken'
    int wght = weight;
    int value = bestValue;
    for (int k = len - 1; k >= 0 && wght > 0; k--)
    {
        if (k > 0 && ks[k - 1][wght] == value)
        {
            continue;
        }
        else if (value > 0)
        {
            taken.push_back(items[k]);
            wght -= items[k].first;
            value -= items[k].second;
        }
    }
    std::reverse(taken.begin(), taken.end());
    return bestValue;
}
