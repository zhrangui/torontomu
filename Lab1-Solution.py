def getName():
  # Use the name displayed on D2L (easier for us to find)
  # Failure to do this correctly will result in many marks deduction
	return "Last name, first name"
	
class Pathfinder():

    def __init__(self, vector):
        # Initialize the Pathfinder object
        self.vector = vector
        self.paths = []
        self.shortestPath = []
        self.longestPath = []
        self.findAllPaths(0,[])

    def findAllPaths(self,position, solution):
        if position >= len(self.vector) or position < 0 or position in solution:
            return 
        elif self.vector[position] == 0:
            solution.append(position)
            self.paths.append(solution)

            #extra bits to figure out longest and shortest paths
            if len(self.paths) == 1:
                self.shortestPath = self.paths[0]
                self.longestPath = self.paths[0]
            elif len(self.paths) > 1:
                if len(solution) > len(self.longestPath):
                    self.longestPath = solution.copy()
                if len(solution) < len(self.shortestPath):
                    self.shortestPath = solution.copy()
        else:
            solution.append(position)
            self.findAllPaths(position+self.vector[position], solution.copy())
            self.findAllPaths(position-self.vector[position], solution.copy())
            return
             

    def getLongest(self):
        return self.longestPath

    def getShortest(self):
	    return self.shortestPath
    
    def getPaths(self):
        return self.paths


if __name__ == "__main__":
    
    
    v1 = [4,3,1,2,3,5,4,2,2,1,1,0]
    v2 = [3,1,1,1,3,4,2,5,3,0]
    v3 = [4,4,1,2,3,1,8,2,0]
    v4 = [2,8,3,2,7,2,2,3,2,1,3,0]
    v5 = [2, 8, 3, 2, 7, 2, 2, 3, 2, 1, 3, 0]
    pf = Pathfinder(v1)
    print("Solving " + str(v1))
    for p in pf.getPaths():
        print(p)
    
    print(f"shortest: {pf.getShortest()}")
    print(f"longest: {pf.getLongest()}")
