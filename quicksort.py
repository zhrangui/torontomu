def partition(A,low,high):
  pivpos =(low+high)//2
  pivot = A[pivpos]

  i = low
  j = high
  while True:
   
    while A[i] < pivot:
      i+=1
    while A[j] > pivot:
      j-=1
    
    if i <= j:
      temp = A[i]
      A[i] = A[j]
      A[j] = temp
     
      print(f"pivotpos: {pivpos:5d}   i: {i:2d}    j: {j:2d}   A:{A}")
      i+=1
      j-=1
      
    if i>j:
      return (i,j)

def quickSort(arr,low,high): 
  if low<high:   
    partIndex = partition (arr,low,high)
    print(f"{low:2d}  to {partIndex[1]:3} : {partIndex[0]:3} to {high:2d}             A:{arr}")
     
    quickSort(arr,low,partIndex[1])
    quickSort(arr,partIndex[0],high)
    



arr =  [5,10,2,3,7,8,9,15,1,4,20]
# arr =  [1,2,3,4,5,6,7,8,9,10,11]
print(f"Original array:                      {arr}")
quickSort(arr,0,len(arr)-1)
print(f"Sorted array:                        {arr}")