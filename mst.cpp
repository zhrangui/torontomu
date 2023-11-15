/*
    Fill in this block comment before submitting.
    Name: Rui Zhang
    No: 500536315
*/

#include <iostream>
#include <string>
#include <algorithm>
#include <vector>

using namespace std;

void prim(vector<vector<int>> &adj, int curr, vector<bool> &visited, vector<int> &distance, vector<int> &parent, int **graph, int **mst, int V)
{
    visited[curr] = true;
    for (int i = 0; i < adj[curr].size(); i++)
    {
        int end = adj[curr][i];
        if ((!visited[end]) && (distance[end] < 0 || distance[end] > graph[curr][end]))
        {
            distance[end] = graph[curr][end];
            parent[end] = curr;
        }
    }
    int minIndex = -1;
    for (int i = 0; i < visited.size(); i++)
    {
        if (!visited[i])
        {
            if (distance[i] > 0 && (minIndex < 0 || distance[minIndex] > distance[i]))
            {
                minIndex = i;
            }
        }
    }

    if (minIndex >= 0)
    {
        mst[minIndex][parent[minIndex]] = distance[minIndex];
        mst[parent[minIndex]][minIndex] = distance[minIndex];
        prim(adj, minIndex, visited, distance, parent, graph, mst, V);
    }
}

void minimumSpanningTree(int **graph, int **mst, int V)
{
    /**************** YOUR CODE HERE! ****************/
    // Parameter V = number of vertices = size of adjacency matrix
    // You may assume parameters graph and mst are properly
    // allocated 2D arrays of size [V][V]
    // You need not allocate or deallocate them in this function
    vector<bool> visited(V, false);
    vector<int> distance(V, -1);
    vector<int> parent(V, -1);

    vector<vector<int>> adj;
    for (int i = 0; i < V; i++)
    {
        vector<int> row;
        for (int j = 0; j < V; j++)
        {
            if (graph[i][j] != 0)
            {
                row.push_back(j);
            }
            mst[i][j] = 0;
        }
        adj.push_back(row);
    }
    distance[0] = 0;
    parent[0] = 0;
    prim(adj, 0, visited, distance, parent, graph, mst, V);
}
