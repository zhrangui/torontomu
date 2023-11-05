/*
    Fill in this block comment before submitting.
    Name: Rui Zhang
    No: 500536315
*/

#include <algorithm>
#include <vector>

using namespace std;

int schedule_processes(int nCPU, vector<int> run_times)
{
    std::vector<int> wait_times;
    std::vector<int> current_time;
    for (int i = 0; i <= nCPU; ++i) {
        wait_times.push_back(0);
        current_time.push_back(0);
    }
    for (int i = 0; i < run_times.size(); i++)
    {
        int min_index = i;
        for (int j = i + 1; j < run_times.size(); j++)
        {
            if (run_times[min_index] > run_times[j])
            {
                min_index = j;
            }
        }
        if (i != min_index)
        {
            std::swap(run_times[i], run_times[min_index]);
        }
        current_time[i % nCPU] += run_times[i];
        wait_times[i % nCPU] += current_time[i % nCPU];
    }
    int total{0};
    for (int i = 0; i < nCPU; i++)
    {
        total += wait_times[i];
    }
    return total;
}

void schedule_rooms(int nRooms, vector<pair<int, int>> &roomReqs, vector<pair<int, int>> schedule[])
{
    /**************** YOUR CODE HERE! ***********************************/
    /* nRooms   = number of rooms available                             */
    /* roomReqs = vector of integer pairs. See test code in main()      */
    /* for an example of how to use vectors/pairs.                      */
    /* schedule = Array of vectors containing integer pairs.            */
    /* Your algorithm will fill this data structure.                    */
    /* Bookings placed in room #1 should be placed in schedule[1], etc. */
    /* Use schedule[0] to store requests that cannot be accommodated.   */
    /********************************************************************/
}
