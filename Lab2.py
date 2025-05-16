def getStudentNumber():
    # This method must return a string of your student number
    # If the number does not match your actual student number
    # You will not get the marks for this lab
	return "012345678"


class Node:
    def __init__(self, data, node=None):
        # Initialize this node, insert data, and set the next node if any
        self.data = data
        self.chain = node

class MyStack:
    def __init__(self, data=None):
        # Initialize this stack, and store data if it exists
        pass

    def push(self, data):
        # Add data to the beginning of the stack
        pass

    def pop(self):
        # Remove the element at the beginning of the stack.
        # Return the data in the element at the beginning of the stack, or None if the stack is empty
        pass

    def top(self):
        # Return the data in the element at the beginning but does not remove it.
        # Return None if stack is empty.
        pass

    def __len__(self):
        # Return the number of elements in the stack
        pass

def sum_exists(n, p_list):
    # Returns True if n can be formed from p_list repeated
    # some arbitrary number of times.
    pass
