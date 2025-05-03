from Stack import *
from Queue import *

class TreeNode():
    def __init__(self,data):
        self.data = data
        self.left  = None
        self.right = None

def levelOrderTraversal(root):
    que = Queue(root)
    while que.size > 0:
        item = que.dequeue()
        #visit it
        print(item.data, end = " ")
        que.enqueue(item.left)
        que.enqueue(item.right)
        
def iterPreOrderTraversal(root):
    stk = Stack(root)
    while stk.top > 0:
        item = stk.pop()
        #visit it
        print(item.data , end = " ")
        stk.push(item.right)
        stk.push(item.left)
    
def preOrderTraversal(root):
    if(root != None):
        #visit 
        print(root.data, end = " ")
        preOrderTraversal(root.left)
        preOrderTraversal(root.right)


alpha = TreeNode("A")

alpha.left = TreeNode("B")
alpha.right = TreeNode("C")
alpha.left.left = TreeNode("D")
alpha.left.right = TreeNode("E")
alpha.right.left = TreeNode("F")
alpha.right.right = TreeNode("G")

print("Level Order: ",end="")        
levelOrderTraversal(alpha)

print("\nPre Order:   ",end="")
iterPreOrderTraversal(alpha)

print("\nPre Order:   ",end="")
preOrderTraversal(alpha)























































