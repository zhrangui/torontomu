
/*
    Fill in this block comment before submitting.
    Name: Rui Zhang
    No: 500536315
*/

#include <iostream>
#include <stdlib.h>

// You are not limited to these functions.
// Write as many helpers as you want
// You might find it useful to overload and
// pass additional arguments, for example.

void selection_sort(int *arr, int n)
{
    int minIndex;
    int min;
    for (int i = 0; i < n; i++)
    {
        min = arr[i];
        minIndex = i;
        for (int j = i + 1; j < n; j++)
        {
            if (arr[j] < min)
            {
                min = arr[j];
                minIndex = j;
            }
        }
        if (minIndex != i)
        {
            arr[minIndex] = arr[i];
            arr[i] = min;
        }
    }
}

void merge(int *arr, int n, int m)
{
    int *copy_arr = new int[n];
    std::copy(arr, arr + n, copy_arr);
    int j = 0;
    int k = m;
    for (int i = 0; i < n; i++)
    {
        if (k >= n)
        {
            arr[i] = copy_arr[j];
            j++;
        }
        else if (j >= m)
        {
            arr[i] = copy_arr[k];
            k++;
        }
        else
        {
            if (copy_arr[j] < copy_arr[k])
            {
                arr[i] = copy_arr[j];
                j++;
            }
            else
            {
                arr[i] = copy_arr[k];
                k++;
            }
        }
    }
    delete[] copy_arr;
}

void merge_sort(int *arr, int n)
{
    if (n <= 1)
        return;
    int m = n / 2;
    merge_sort(arr, m);
    merge_sort(arr + m, n - m);
    merge(arr, n, m);
}

void merge_sel_sort(int *arr, int n)
{
    if (n <= 4)
    {
        selection_sort(arr, n);
    }
    else
    {
        merge_sort(arr, n);
    }
}
