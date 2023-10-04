/*
    When I test your code, it will be with my own 
    unmodified version of this file.

    Functions in dnc.cpp will be called as seen below.
    However - you may write as many helper functions as
    you want in dnc.cpp.
*/

#include <iostream>
#include <vector>
#include <algorithm>
#include <random>

#include "dnc.hpp"

int main() 
{
    // Fancy C++ RNG
    std::random_device rd;
    std::mt19937 rng(rd());
    std::uniform_int_distribution<uint32_t> dis(0, UINT32_MAX);

    // Create vector containing all ints between 0 and 1024, 
    // to be used in the tests for both problems.
    std::vector<int> sorted_seq(1024);
    for (int i = 0; i < sorted_seq.size(); i++) 
        sorted_seq[i] = i;

    // ########################################################
    // ########## PART I: First Missing Integer ###############
    // ########################################################
    {
        // Test both implementations n times
        int n = 10000, n_correct = 0;
        for (int i = 0; i < n; i++)
        {
            // Create copy of vector, randomly remove 50 elements, 
            std::vector<int> vec_in(sorted_seq);
            for (int j = 0; j < 50; j++) {
                uint32_t idx = dis(rng) % vec_in.size();
                vec_in.erase(vec_in.begin() + idx);
            }

            // These two return values should be the same!
            int missing_iterative = first_missing_iterative(vec_in);
            int missing_dnc = first_missing_dnc(vec_in);

            // Notice that this test code is NOT verifying correctness.
            // It's just checking that the two values are the same.
            // The linear approach should be fairly trivial get get right.
            if (missing_iterative == missing_dnc)
                n_correct++;
        }
        printf("Part I:  Passed %d/%d\n", n_correct, n);
    }

    // ########################################################
    // ########## PART II: Counting Inversions ################
    // ########################################################
    {
        std::vector<int> vec_in(sorted_seq);
        
        int n = 100, n_correct = 0;
        for (int i = 0; i < n; i++)
        {
            std::shuffle(vec_in.begin(), vec_in.end(), rng);
        
            int inversion_iterative = count_inversions_iterative(vec_in);
            int inversion_dnc = count_inversions_dnc(vec_in);

            if (inversion_iterative == inversion_dnc)
                n_correct++;
        }
        printf("Part II: Passed %d/%d\n", n_correct, n);
    }

    // ########################################################
    // ########## PART III: Max Subarray Sum ##################
    // ########################################################
    {
        // Shift vector into range -511 to 512
        std::vector<int> vec_in(sorted_seq);
        for (int i = 0; i < vec_in.size(); i++) 
            vec_in[i] -= 511;

        int n = 100, n_correct = 0;
        for (int i = 0; i < n; i++)
        {
             std::shuffle(vec_in.begin(), vec_in.end(), rng);
        
             int sum_iterative = max_subarray_sum_iterative(vec_in);
             int sum_dnc = max_subarray_sum_dnc(vec_in);

             if (sum_iterative == sum_dnc)
                 n_correct++;
        }
        printf("Part III: Passed %d/%d\n", n_correct, n);
    }

    return 0;
}


