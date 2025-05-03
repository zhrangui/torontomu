x = [1, 2, 3, 4, 5]
def sum3(x):
    if len(x) == 0:
        return 0
    else:
        return x.pop(0) + sum3(x)


def sum4(x):
    if len(x) == 0:
        return 0
    elif len(x)  == 1:
        return x.pop()
    else:
        mid = len(x)//2
        firstHalf =  x[:mid]
        secondHalf = x[mid:]
        return sum4(firstHalf) + sum4(secondHalf)


def sumU(A, m, n):
    if m < n:
        return A[m] + sumU(A,m+1,n)
    elif m == n:
        return A[m]
    else:
        return 0


def sumD(A, m, n):
    if m < n:
        return A[n] + sumD(A,m,n-1)
    elif m == n:
        return A[m]
    else:
        return 0    

    
def sumE(A, m, n):
    if m < n:
        return A[m] + A[n] + sumD(A,m+1,n-1)
    elif m == n:
        return A[m]
    else:
        return 0


def swapStr(s, m, n):
    s1 = s[m]
    s2 = s[n]
    return s[0:m] + s2 + s[m+1:n] + s1 + s[n+1:]


def reverseStr(s, m, n):
    if m < n:
        s = swapStr(s,m,n)
        return reverseStr(s,m+1,n-1)
    else:
        return s



def reverseStr1(s): 
    if len(s) == 0: 
        return s 
    else: 
        return reverseStr1(s[1:]) + s[0] 

    
def reverseStr2(s): 
    if len(s) == 0: 
        return s 
    else: 
        return s[len(s)-1] + reverseStr2(s[0:-1])


def factorial(n):
    if n == 0:
        return 1
    else:
        return n * factorial(n-1)


def factorialRec(n, accumulator):
    if n <= 1:
        return accumulator
    else:
        return factorialRec(n-1,n*accumulator)

def factorial1(n):
    return factorialRec(n,1)


def swap(A, m, n):
    A[m], A[n] = A[n], A[m] 
    return A

def reverseList(A, m, n):
    if m < n:
        swap(A,m,n)
        reverseList(A,m+1,n-1)

def printList(A):
    if len(A) > 0:
        print(A[0])
        printList(A[1:])

        
hello  = "hello world" 
print(reverseStr1(hello))   
#print(reverseStr("hello",0,4))
# print(reverseStr(hello,0,len(hello)-1))
# print(factorial1(5))
#printList(x)
