/*
    Fill in this block comment before submitting.
    Name: <your name here>
*/

#include <iostream>
#include <vector>

// You are not limited to these functions.
// Write as many helpers as you want
// You might find it useful to overload and
// pass additional arguments, for example.
// Linear search loops on n elements, so the time complexity is n
// equals O(n)
int first_missing_iterative(const std::vector<int> &sorted_vec)
{
    // Your code here
    for (int i = 1; i < sorted_vec.size(); i++)
    {
        if (sorted_vec[i - 1] + 1 != sorted_vec[i])
        {
            return sorted_vec[i - 1] + 1;
        }
    }
    return -1;
}

int _first_missing_dnc(const std::vector<int> &sorted_vec, int start, int end)
{
    if (end - start > 1)
    {
        int middle = (start + end) / 2;
        int missing = _first_missing_dnc(sorted_vec, start, middle);
        if (missing > 0)
        {
            return missing;
        }
        missing = _first_missing_dnc(sorted_vec, middle, end);
        if (missing > 0)
        {
            return missing;
        }
    }
    if (sorted_vec[start] + 1 != sorted_vec[start + 1])
    {
        return sorted_vec[start] + 1;
    }
    return -2;
}

// Each loop divides into 2 subproblem with n/2 elements, and has one comparison which is O(1)
// T(n) = 2T(n/2) + O(1), there is lg(n) recursive calls
// T(n) = lg(n)
int first_missing_dnc(const std::vector<int> &sorted_vec)
{
    // Your code here
    return _first_missing_dnc(sorted_vec, 0, sorted_vec.size());
}


int count_inversions_iterative(const std::vector<int> &arr)
{
    // Your code here
    int count = 0;
    for (int i = 1; i < arr.size(); i++)
    {
        if (arr[i - 1] > arr[i])
        {
            count++;
        }
    }
    return count;
}

int _count_inversions_iterative(const std::vector<int> &arr, int start, int end)
{
    if (end - start > 1)
    {
        int middle = (start + end) / 2;
        int count = _first_missing_dnc(arr, start, middle);

        count += _first_missing_dnc(arr, middle, end);
        return count;
    }
    if (arr[start] > arr[start + 1])
    {
        return 1;
    }
    return 0;
}

int count_inversions_dnc(const std::vector<int> &arr)
{
    // Your code here
    return _count_inversions_iterative(arr, 0, arr.size());
}

int max_subarray_sum_iterative(const std::vector<int> &arr)
{
    // Your code here
    return -1;
}

int max_subarray_sum_dnc(const std::vector<int> &arr)
{
    // Your code here
    return -2;
}