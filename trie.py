class Trie:
    """
    208. Implement Trie (Prefix Tree)
    """

    def __init__(self):
        ...
        
    def insert(self, word: str) -> None:
        ...
    def search(self, word: str) -> bool:
        ...

    def startsWith(self, prefix: str) -> bool:
        ...

        # Your Trie object will be instantiated and called as such:
        # obj = Trie()
        # obj.insert(word)
        # param_2 = obj.search(word)
        # param_3 = obj.startsWith(prefix)

def test_trie():
    trie = Trie()
    trie.insert("apple")
    assert trie.search("apple")

if __name__ == '__main__':
    import pytest
    pytest.main([__file__])