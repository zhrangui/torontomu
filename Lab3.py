def getStudentNumber():
    # This method must return your name EXACTLY as D2L presents it.
    # If this does not work, you will fail this lab.
    return "123456789"


class MyBST:
    def __init__(self, data, promote_right=True):
        # Initialize this node, and store data in it
        self.data = data
        self.left = None
        self.right = None
        self.height = 0

        # Set promote_right to TRUE if you are implementing
        # the promotion of the smallest node on left subtree,
        # Otherwise, set it to FALSE
        self.promote_right = promote_right

    def getLeft(self):
        # Return the left child of this node, or None
        return self.left

    def getRight(self):
        # Return the right child of this node, or None
        return self.right

    def getData(self):
        # Return the data contained in this node
        return self.data

    def getHeight(self):
        # Return the height of this node
        return self.height

    def updateHeight(self):
        # Update the height of this node
        pass

    def __contains__(self, data):
        pass
        # Returns true if data is in this node or a node descending from it
        # This overloaded method allows you to use the python operator 'in'

    def insert(self, data):
        # Insert data into the tree, descending from this node
        # Ensure that the tree remains a valid Binary Search Tree
        # Return this node after data has been inserted
        if data < self.data:
            if self.left:
                self.left.insert(data)
            else:
                self.left = MyBST(data)
        else:
            if self.right:
                self.right.insert(data)
            else:
                self.right = MyBST(data)
        self.updateHeight()
        return self

    def findSmallest(self):
        pass
        # Return the value of the smallest node

    def findLargest(self):
        pass
        # Return the value of the largest node

    def remove(self, data):
        pass
        # Remove find the data in the input parameter and remove it
        # Ensure that the tree remains a valid Binary Search Tree
        # Return this node after data has been inserted

# Bonus functions to help you debug
def printTree_(tree, prefix):
    if tree.getLeft() is not None:
        printTree_(tree.getLeft(), prefix + "+ ")
    print(f"{prefix}{tree.data}")
    if tree.getRight() is not None:
        printTree_(tree.getRight(), prefix + "- ")

def printTree(tree):
    printTree_(tree, "")

if __name__=="__main__":
    #Implement your testing logic here.
    #This code will not execute if this file is loaded as a library.
    pass
