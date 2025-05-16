def getStudentNumber():
    return "123456789"


class MyTrie:
    def __init__(self):
        # Initialize the trie node as needed
        self.children_links = [None] * 54
        self.TERMINAL = 0

    def char_to_position(c):
        # index 0 is the TERMINAL flag
        # index 1 is the apostrophe (')
        # index 2-27 is A-Z
        # index 28-53 is a-a
        if c == "'":
            return 1
        elif c == "#":
            return 0
        elif "A" <= c <= "Z":
            return 2 + ord(c) - ord("A")
        elif "a" <= c <= "z":
            return 28 + ord(c) - ord("a")
        return -1

    def insert(self, word, position=0):
        # Insert word into the correct place in the trie
        pass

    def remove(self, word, position=0):
        # Find and remove the node that contains the word
        pass

    def depth_of_word(self, word, position=0):
        # Return the depth of the node that contains the word
        pass

    def exists(self, word, position=0):
        # Return true if the passed word exists in this trie node
        pass

    def autoComplete(self, prefix, position=0):
        # Return every word that extends this prefix in alphabetical order
        pass