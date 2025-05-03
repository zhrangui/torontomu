
def fib(x):
  if x==0:
    return 0
  if x==1:
    return 1
  return fib(x-1) + fib(x-2)


saved = [None]*100
def fib2(x):
    if x==0:
        return 0
    if x ==1:
        return 1
    if saved[x] is not None:
        return saved[x]

    saved[x] = fib(x-1) + fib(x-2)
    return saved[x]


def fib3(x):
    saved = [None]*100
    saved[0] = 0
    saved[1] = 1
    for i in range(2,x+1):
        saved[i] = saved[i-1] + saved[i-2]
    
    return saved[x]



print(fib(60))
print(fib2(6))
print(fib3(6))
