def sum1(x):
    sum = 0
    for count in range(1,x+1):
        sum = sum + count
    return sum

def sum2(x):
    sum = (x*(x+1))//2
    return sum

#demo code for matrix multiplication
#initializing a 1D vector and a 2D Array
N = 5;
V = [0]*N
A = [[0 for i in range(N)] for j in range(N)] 

for i in range(N):
    V[i] = i+1
    for j in range(N):
        A[i][j] = i*j

#function that mutiply a vector with a square matrix
def matrixMul(V, A):
    sum = 0
    R = [0]*len(V)
    for i in range(len(V)):
        for j in range(len(V)):
            sum = sum + (V[i]*A[i][j])
        R[i] = sum
    return R

def findIndex(A, I):
    if len(A) <= 0:
        return False
    for i in range(len(A)):
        if A[i] == I:
            return i
    return None

def findItemR(A, I):
    if len(A) == 0:
        return None
    if A[0] == I:
        return True
    return findItemR(A[1:],I)
 
def factorialI(x):
    product = 1
    for i in range(2,x+1):
        product = product*i
    return product


def binSearch (A, K, L, R,x=0):  
    if L > R:
        #not found
        return None
  
    #calculate midpoint
    M = (L+R)//2 
  
    if K == A[M]:
        #key found return position
        return M
    if K > A[M]:
        #check right half
        return binSearch(A, K, M+1, R)
    else:
        return binSearch(A, K, L, M-1,x)
    

A = [2,4,9,12,15,21,25,29,30,32,36,37,38,39,42]

print(binSearch(A,25,0,len(A)-1))