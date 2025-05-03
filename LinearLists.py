

class Node():
    def __init__(self, data):
        self.data = data
        self.link = None
        
class LinkedList:
    def __init__(self):
        self.head = None
    
    def insert(self,newData):
        newNode = Node(newData)
        point = self.head
        
        if self.head is None:
            self.head = newNode
            return self
        
        if self.head.data > newData:
            newNode.link = point
            self.head = newNode
            return self

        while point.link is not None and point.link.data < newData:
            point = point.link
                
        newNode.link = point.link
        point.link = newNode
        
        return self
    
    def retrieve(self,item):
        
        if self.head is None:
            return None
        
        if self.head.data == item:
            temp = point
            self.head = point.link
            return temp
        
        point = self.head
        
        while point.link is not None and point.link.data != item:
            point = point.link
        
        if point.link is None:
            return None
        
        temp = point.link
        point.link = point.link.link
        return temp
    
    def printList(self):
        point = self.head
        while point is not None:
            print(f"{point.data} ->", end=" ")
            point = point.link        
        print(point)
        
        
class LinkedListWithHeader:
    def __init__(self):
        newNode = Node(0)
        newNode.link = newNode
        self.head = newNode
        
    def insert(self,newData):
        newNode = Node(newData)
        point = self.head 
        
        while point.link != self.head and point.link.data < newData:
            point = point.link
                
        newNode.link = point.link
        point.link = newNode
    
    def retrieve(self,item):
        point = self.head
        while point.link is not self.head and point.link.data != item:
            point=point.link
        
        if point.link == self.head:
            return None
        
        temp = point.link
        point.link = point.link.link
        return temp

    def printList(self):
        point = self.head
        print("Head -> ",end="")
        while point.link is not self.head:
            print(f"{point.link.data} ->", end=" ")
            point = point.link        
        print("Head")




# ll = LinkedList()
# ll.insert("F")
# ll.insert("A")
# ll.insert("D")
# ll.insert("X")

# ll.printList()
# n = ll.retrieve("D").data        
# print(f"Deleting {n}")
# ll.printList()


ll2 = LinkedListWithHeader()
ll2.insert("F")
ll2.insert("A")
ll2.insert("D")
ll2.printList()
n = ll2.retrieve("A").data        
print(f"Deleting {n}")
ll2.printList()


class DoubleNode():
    def __init__(self, data):
        self.data = data
        self.forward = None
        self.back = None

class DoubleLinkedList():
    def __init__(self):
        newNode = DoubleNode(None)
        newNode.back = newNode
        newNode.forward = newNode
        self.head = newNode

    def insert(self,newData):
        newNode = DoubleNode(newData)
        
        point = self.head.forward
        while point is not self.head and point.data < newData:
            point = point.forward
        
        newNode.back = point.back
        newNode.forward = point
        point.back.forward = newNode
        point.back =newNode
        
        return self
    
    def retrieve(self,item):
        point = self.head.forward
        while point is not self.head and point.data != item:
            point=point.forward
        
        if point == self.head:
            return None
        
        temp = point
        point.back.forward = point.forward
        point.forward.back = point.back
        return temp
    
    def printList(self):
        point = self.head.forward
        print("Head -> ",end="")
        while point is not self.head:
            print(f"{point.data} ->", end=" ")
            point = point.forward        
        print("Head")
        
# dll = DoubleLinkedList()
# dll.insert(250)
# dll.insert(225)
# dll.insert(201)
# dll.insert(245)
# dll.insert(275)
# dll.printList()
# n = dll.retrieve(225).data
# print(f"Deleting {n}")
# dll.printList()

node1 = Node(3)
node2 = Node(5)
node3 = Node(7)
node1.link = node2
node2.link = node3

newNode = Node(6)
newNode.link = node1.link.link
node1.link.link = newNode

print(node1.link.link.link.data)



