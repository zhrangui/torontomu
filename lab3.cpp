#include <iostream>
#include <vector>
#include <algorithm>
#include <string>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <assert.h>
#include <random>

#include "greedy.hpp"

using namespace std;

void printRequests(vector<pair<int, int>> & roomReqs);
void printBookings(int nRooms, vector<pair<int, int>> bookings[]);

void generateIntervals(int n, vector<pair<int, int>> & intervals);
bool validateSchedule(int nRooms, vector<pair<int, int>> & intervals, vector<pair<int, int>> bookings[]);

int main()
{
	srand((int)time(NULL));
	
	// ###############################################################
    // ########## PART I: Cyclic process scheduling ##################
    // ###############################################################
	{
		vector<int> runtimes;
		runtimes.push_back(3); runtimes.push_back(5); runtimes.push_back(6);
		runtimes.push_back(10); runtimes.push_back(11); runtimes.push_back(14);
		runtimes.push_back(15); runtimes.push_back(18); runtimes.push_back(20);

		int tw = schedule_processes(3, runtimes);

		printf("Total wait time for [ 3, 5, 6, 10, 11, 14, 15, 18, 20 ]");
		printf("  You said:  %d\n", tw);
		printf("  Should be: 165\n");

		// Fancy C++ RNG
    	std::random_device rd;
    	std::mt19937 rng(rd());
		// Shuffling the input should have no effect on result!
		printf("Shuffling 500 times... ");
		for (int i = 0; i < 500; i++)
		{
			std::shuffle(runtimes.begin(), runtimes.end(), rng);
			tw = schedule_processes(3, runtimes);
			assert(tw == 165);
		}
		printf("Passed!\n");
	}

	// ###############################################################
    // ########## PART II: Hotel Booking, Small tests ################
    // ###############################################################
	{
		// 5 requests: [(1, 2), (3, 6), (5, 8), (6, 7), (6, 8)]
		vector<pair<int, int>> requests;
		requests.push_back(pair<int, int>(1, 2));
		requests.push_back(pair<int, int>(3, 6));
		requests.push_back(pair<int, int>(5, 8));
		requests.push_back(pair<int, int>(6, 7));
		requests.push_back(pair<int, int>(6, 8));

		// Allocate array of vectors for three rooms.
		// nRooms+1 to account for bookings that can't be accommodated
		vector<pair<int, int>> three_rooms[4];
		vector<pair<int, int>> two_rooms[3];

		/** Call your scheduleRooms() function here **/
		schedule_rooms(3, requests, three_rooms);
		schedule_rooms(2, requests, two_rooms);
		/*********************************************/

		cout << "Room request intervals:" << endl;
		printRequests(requests);
		cout << endl << "Scheduling with three rooms:" << endl;
		printBookings(3, three_rooms);
		cout << endl << "Scheduling with two rooms:" << endl;
		printBookings(2, two_rooms);
		cout << endl;
	}

	// ###############################################################
    // ########## PART II: Hotel Booking, Large tests ################
    // ###############################################################
	{
		int numIntervals[] = { 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536 };
		for (int n : numIntervals)
		{
			vector<pair<int, int>> reqs;
			generateIntervals(n, reqs);

			// sqrt(n) seems like a reasonable number of rooms for n total bookings...
			int nRooms = (int) sqrt(n);
			vector<pair<int, int>> *n_rooms = new vector<pair<int, int>>[nRooms + 1];

			cout << "Testing " << n << " intervals... ";
			/** Call your scheduleRooms() function here **/
			schedule_rooms(nRooms, reqs, n_rooms);
			/*********************************************/
			assert(validateSchedule(nRooms, reqs, n_rooms));
			cout << "Passed!" << endl;
			delete[] n_rooms;
		}
	}

	printf("\n");
}

// Primitive function for generating random vectors of intervals. 
void generateIntervals(int n, vector<pair<int, int>> & intervals)
{
	for (int i = 0; i < n; i++)
	{
		int start = rand() % (i + 1) * 2 + 1;
		int dif = rand() % (i + 1) + 1;
		intervals.push_back(pair<int, int>(start, start + dif));
	}
}

// Function for validating scheduling. Does not check for optimal solution,
// Just verifies that no bookings overlap. Checks for feasible solution!
bool validateSchedule(int nRooms, vector<pair<int, int>> & intervals, vector<pair<int, int>> bookings[])
{
	for (int i = 1; i < nRooms + 1; i++)
	{
		// Check that intervals in each room don't overlap
		for (int j = 1; j < (int)bookings[i].size(); j++)
			if (bookings[i][j - 1].second > bookings[i][j].first) {
				cout << "Bookings overlap!" << endl;
				return false;
			}
	}

	int count = 0;
	for (int i = 0; i < nRooms + 1; i++)
	{
		// Check that interval in schedule exists in vector of intervals
		for (pair<int, int> p : bookings[i])
			if (std::find(intervals.begin(), intervals.end(), p) == intervals.end()) {
				cout << "Non-existent booking!" << endl;
				return false;
			}

		// Ensure all intervals are present in schedule (includes no room)
		count += bookings[i].size();
	}
    
	if (count != intervals.size()) {
		cout << "Wrong number of bookings!" << endl;
		return false;
	}

	return true;
}


void printRequests(vector<pair<int, int>> & roomReqs)
{
	cout << "[ ";
	for (pair<int, int> p : roomReqs)
		cout << "(" << p.first << ", " << p.second << ") ";
	cout << "]" << endl;
}

void printBookings(int nRooms, vector<pair<int, int>> bookings[])
{
	for (int i = 1; i < nRooms + 1; i++) {
		cout << "Room #" << i << ": [ ";
		for (pair<int, int> p : bookings[i])
			cout << "(" << p.first << ", " << p.second << ") ";
		cout << "]" << endl;
	}
	cout << "No room: [ ";
	for (pair<int, int> p : bookings[0])
		cout << "(" << p.first << ", " << p.second << ") ";
	cout << "]" << endl;
}
