class Trie:
    """
    208. Implement Trie (Prefix Tree)
    # Your Trie object will be instantiated and called as such:
    # obj = Trie()
    # obj.insert(word)
    # param_2 = obj.search(word)
    # param_3 = obj.startsWith(prefix)
    """

    def __init__(self):
        self.children = {}
        self.is_end = False
       
    def get(self, character):
        return self.children.get(character)

    def insert(self, word: str) -> None:
        trie = self.get(word[0])
        if not trie:
            trie = Trie()
            self.children[word[0]]=trie
        if word[1:]:
            trie.insert(word[1:])
        else:
            trie.is_end = True

    def find(self, word: str):
        tri = self.get(word[0])
        if tri is None:
            return False
        for w in word[1:]:
            tri = tri.get(w)
            if not tri:
                return False
        return tri
    
    def search(self, word: str) -> bool:
        tri = self.find(word)
        if tri is False:
            return False
        return tri.is_end
            
    def startsWith(self, prefix: str) -> bool:
        if self.find(prefix) is False:
            return False
        return True

def test_trie():
    trie = Trie()
    trie.insert("apple")
    trie.insert("app")
    assert trie.search("app")
    assert trie.startsWith("a")

if __name__ == '__main__':
    import pytest
    pytest.main([__file__])