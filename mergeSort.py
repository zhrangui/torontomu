def merge(A, l, m, r):

    n1 = m - l + 1
    n2 = r - m
    
    # Create temp array
    L = [0] * n1
    R = [0] * n2

    # Copy data to temp arrays L[] and R[] 
    for i in range(0, n1):
        L[i] = A[l + i]
    for j in range(0, n2):
        R[j] = A[m + 1 + j]
    print(f"L: {L} R: {R}")
    # Merge the temp arrays back into A[l..r]
 
    # Initial index of first subarray
    i = 0
 
    # Initial index of second subarray
    j = 0
 
    # Initial index of merged subarray
    k = l

    while i < n1 and j < n2:
        if L[i] <= R[j]:
            A[k] = L[i]
            i+=1
        else:
            A[k] = R[j]
            j+=1
        k+=1
     
    # Copy the remaining elements of
    # L[], if there are any
    while (i < n1):
        A[k] = L[i]
        i+=1
        k+=1

 
    # Copy the remaining elements of
    # R[], if there are any
    while (j < n2):
        A[k] = R[j]
        j+=1
        k+=1

    
        
def mergeSort(A, l, r):
    if r == 0:
        return
    if l<r:  
        m =l + (r-l)//2
        # print(f"m: {m}")
        mergeSort(A,l,m)
        mergeSort(A,m+1,r)
        # print(A)
        merge(A,l,m,r)
        print(A)
        
    
    
        


arr = [7,5,8,11,1,6,21,9]
# arr = [5,10,2,3,7,8,9,15,1,4,20]
print(f"\nsorting: {arr}")
n = len(arr)
mergeSort(arr,0,n-1)
print(f" result: {arr}")