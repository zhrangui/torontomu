def TowerOfHanoi(n , start, end, spare): 
    if n == 1: 
        print(f"Move disk 1 from {start} to {end}")  
    else:
        TowerOfHanoi(n-1, start, spare, end) 
        print(f"Move disk {n} from {start} to {end}")
        TowerOfHanoi(n-1, spare, end, start) 

TowerOfHanoi(6, "one", "three", "two")

