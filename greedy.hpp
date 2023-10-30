
/*
    *** DO NOT MODIFY THIS FILE ***
    
    scheduleRooms in sched.cpp must match this prototype.
    This is how it will be called in lab4.cpp
    However - you may use as many helper functions as
    you want in sched.cpp.
*/

#include <vector>
using namespace std;

int schedule_processes(int nCPU, vector<int> run_times);
void schedule_rooms(int nRooms, vector<pair<int, int>> & roomReqs, vector<pair<int, int>> schedule[]);

