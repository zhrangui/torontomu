from Stack import *
from Queue import *

def match(opening,closing):
    if opening == "[" and closing == "]":
        return True
    elif opening == "(" and closing == ")":
        return True
    elif opening == "{" and closing == "}":
        return True
    
    return False

def isBalanced(str_):
    s = Stack()

    for i in str_:
        if i == "(" or i == "[" or i == "{":
            s.push(i)
        elif i == ")" or i == "]" or i == "}":
            if s.isEmpty():
                print("More right parentheses than left")
                return False
            else:
                bracket = s.pop()
                if not match(bracket,i):
                    print("Mismatched parentheses")
                    return False
    
    if s.isEmpty():
        return True
    else:
        print("More left parentheses than right")
        return False

# statement = "((B[3] * 2) * k)"
# print(isBalanced(statement))


def isOperator(character):
    if character in "+-*/":
        return True
    return False

def calculate(operand1, operand2, operator):
    if operator == "+": return int(operand1) + int(operand2)
    if operator == "-": return int(operand1) - int(operand2)
    if operator == "*": return int(operand1) * int(operand2)
    if operator == "/": return int(operand1) // int(operand2)

def evalPostfix(exp):
    s = Stack()
    for i in exp:    
        if i.isdigit():            
            s.push(i)
        elif isOperator(i):
            rightVal = s.pop()
            leftVal = s.pop()
            result = calculate(leftVal,rightVal,i)
            s.push(result)

    return s.pop()



def prec(ops):
    if ops in "()": return 0
    if ops in "^":  return 3
    if ops in "*/": return 2
    if ops in "+-": return 1

def infixToPostfix(exp):
    output = []
    s = Stack()
    for i in exp:

        if i.isdigit() or i.isalpha():
            output.append(i)
        elif i == "(":
            s.push(i)
        elif i == ")":        
            while not s.isEmpty() and s.peek() != "(":
                output.append(s.pop())
            
            s.pop()
        elif isOperator(i):            
            while not s.isEmpty() and prec(i) <= prec(s.peek()):
                output.append(s.pop())
            s.push(i)
    
    while not s.isEmpty():
        output.append(s.pop())
    return output

    




# exp = "1+2*3-4*5"
# exp = "((1 +2 ) * 3 - 4) * 5"


# postfix = infixToPostfix(exp)
# print(postfix)

# print(evalPostfix(postfix))



#Lab 2 test codes
# stk = Stack(7)
# stk.push(5)
# stk.push(20)
# stk.push(11)
# stk.push(-5)
# print(f"popping {stk.pop()} from stack")
# print(f"popping {stk.pop()} from stack")


# que = Queue()
# que.enqueue(7)
# que.enqueue(5)
# que.enqueue(20)
# que.enqueue(11)
# que.enqueue(-5)
# print(f"dequeuing {que.dequeue()} from queue")
# print(f"dequeuing {que.dequeue()} from queue")
































































