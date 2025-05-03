import random
import string
import re
#Module Imports
import sys
from importlib import import_module

def pathTest(vector, path):
    def pathTest_(vector, path, position, location):
        if(location == len(path)-1):
            if(vector[path[location]] == 0):
                return True
            else:
                return False
        elif location >= len(vector) or location < 0:
            return False
        else:
            return pathTest_(vector, path, position + vector[path[location]], location +1 ) or pathTest_(vector, path, position - vector[path[location]], location +1 )

    return pathTest_(vector, path, 0,0)

def Test(lib, seed=0, size=10, verbose=False):
    known = [
        ([2, 8, 3, 2, 7, 2, 2, 3, 2, 1, 3, 0, 1], 6, 11),
        ([2,3,1,1,0], 4, 4),
        ([3, 1, 1, 1, 3, 4, 2, 5, 3, 0], 100, -1),
        ([2,0,1,2,5,4], 3, 5),
        ([4,3,2,5,1,4,3,2,0,5,4,3,2,5,4,2,0,6,4,3,1,0,2,4,3,6,1,3], 4, 10)
    ]

    for (vector, targetMin, targetMax) in known:
        localMin, localMax = 100, -1
        
        if verbose:
            print("Testing vector ", vector)
        
        try:
            finder = lib.Pathfinder(vector)
        except:
            if verbose:
                print("Error: Pathfinder not creatable")
            return False

        flag = True
        try:
            shortest = finder.getShortest()
        except:
            if verbose:
                print("Error: Shortest path not retrievable")
            flag = False
        
        if shortest:
            if pathTest(vector, shortest):
                localMin = len(shortest)
            else: 
                if verbose:
                    print("Error: Shortest path not valid")
                flag = False
        if verbose:
            print("Shortest path: ", shortest)
        if localMin != targetMin:
            if verbose:
                print("Error: Shortest path size incorrect")
            flag = False
        yield flag
        
        flag = True
        try:                
            longest = finder.getLongest()
        except:
            if verbose:
                print("Error: Longest path not retrievable")
            flag = False
        if verbose:
            print("Longest path:  ", longest)
        if longest:
            if pathTest(vector, longest):
                localMax = len(longest)
            else: 
                if verbose:
                    print("Error: Longest path not valid")
                flag = False
        
        if localMax != targetMax:
            if verbose:
                print("Error: Longest path size incorrect")
            flag = False
            
        yield flag

        if verbose:
            print()
        
        

if __name__ == "__main__":    
    # if len(sys.argv) < 2:
    #     print("Include at least a library name as an argument.")
    #     exit()
    # name = sys.argv[1]
    name = "Lab1-Solution.py" 
    if name.startswith(".\\"):
        name = name[2:]
    if name.endswith(".py"):
        name = name[:-3]
    module=import_module(name,package=__name__)
    print(f"Testing module {name} by {module.getName()}")
    score=0
    for i in Test(module,seed=123456, size=20, verbose=True):
        if i:
            score+=0.5

    print(f"Test result: {score}/5")