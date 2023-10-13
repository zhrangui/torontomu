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

int first_missing_dnc_divide_conquer(const std::vector<int> &sorted_vec, int start, int end)
{
    if (end - start > 1)
    {
        int middle = (start + end) / 2;
        int missing = first_missing_dnc_divide_conquer(sorted_vec, start, middle);
        if (missing > 0)
        {
            return missing;
        }
        missing = first_missing_dnc_divide_conquer(sorted_vec, middle, end);
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
    return first_missing_dnc_divide_conquer(sorted_vec, 0, sorted_vec.size());
}

// Two nested loops, each one loops n elements, the time complexity equals n*n
// then O(n^2)
int count_inversions_iterative(const std::vector<int> &arr)
{
    // Your code here
    int count = 0;
    for (int i = 0; i < arr.size(); i++)
    {
        for (int j = i + 1; j < arr.size(); j++)
            if (arr[i] > arr[j])
            {
                count++;
            }
    }
    return count;
}

int count_inversions_dnc_divide_conquer(std::vector<int> &arr, int start, int end)
{
    int count = 0;
    if (end - start > 1)
    {
        int middle = (end + start) / 2;
        int left = count_inversions_dnc_divide_conquer(arr, start, middle);
        int right = count_inversions_dnc_divide_conquer(arr, middle, end);
        count = left + right;
        std::vector<int> arr_copy(arr.begin() + start, arr.begin() + end);
        int j = 0;
        int k = 0;
        int m = middle - start;
        for (int i = 0; i < end - start; i++)
        {
            if (j >= m)
            {
                arr[start + i] = arr_copy[m + k];
                k++;
            }
            else if (k >= end - middle)
            {
                arr[start + i] = arr_copy[j];
                j++;
            }
            else
            {
                if (arr_copy[j] <= arr_copy[m + k])
                {
                    arr[start + i] = arr_copy[j];
                    j++;
                }
                else
                {
                    arr[start + i] = arr_copy[m + k];
                    k++;
                    count += m - j;
                }
            }
        }
    }
    return count;
}

int count_inversions_dnc(const std::vector<int> &arr)
{
    // Your code here
    std::vector<int> arr_copy(arr);
    return count_inversions_dnc_divide_conquer(arr_copy, 0, arr_copy.size());
}

// Two nested loop with n iterarion, n x n=n^2
// O(n^2)
int max_subarray_sum_iterative(const std::vector<int> &arr)
{
    // Your code here
    int max = arr[0];
    for (int i = 0; i < arr.size(); i++)
    {
        int total = arr[i];
        for (int j = i + 1; j < arr.size(); j++)
        {
            total += arr[j];
            if (max < total)
            {
                max = total;
            }
        }
    }

    return max;
}

int max_subarray_sum_dnc_divide_conquer(const std::vector<int> &arr, int start, int end)
{
    if (end - start < 2)
    {
        return arr[start];
    }
    int middle = (end + start) / 2;
    int left = max_subarray_sum_dnc_divide_conquer(arr, start, middle);
    int right = max_subarray_sum_dnc_divide_conquer(arr, middle, end);
    int max_middle = arr[middle - 1] + arr[middle];
    int total = max_middle;
    for (int i = middle - 2; i >= start; i--)
    {
        total += arr[i];
        if (total > max_middle)
        {
            max_middle = total;
        }
    }
    total = max_middle;
    for (int i = middle + 1; i < end; i++)
    {
        total += arr[i];
        if (total > max_middle)
        {
            max_middle = total;
        }
    }
    return std::max(std::max(left, right), max_middle);
}
// T(n) = 2T(n/2) + O(n)
// O(nlog(n))
int max_subarray_sum_dnc(const std::vector<int> &arr)
{
    // Your code here
    return max_subarray_sum_dnc_divide_conquer(arr, 0, arr.size());
}