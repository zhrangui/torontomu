
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

void merge_sort(int *arr, int n)
{
    // Your code here
}

void merge_sel_sort(int *arr, int n)
{
    // Your code here
}
