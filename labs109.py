# As an example, here is an implementation of
# the first problem "Ryerson Letter Grade":
import itertools

def ryerson_letter_grade(n):
    if n < 50:
        return 'F'
    elif n > 89:
        return 'A+'
    elif n > 84:
        return 'A'
    elif n > 79:
        return 'A-'
    tens = n // 10
    ones = n % 10
    if ones < 3:
        adjust = "-"
    elif ones > 6:
        adjust = "+"
    else:
        adjust = ""
    return "DCB"[tens - 5] + adjust

def is_ascending(items):
    """
    2. Ascending list
    """
    for pairs in itertools.pairwise(items):
        if pairs[0] >= pairs[1]:
            return False
    return True    

def riffle(items, out=True):
    """
    3. Riffle shuffle kerfuffle
    """
    shuffle = []
    half = len(items)//2
    for index in range(half):
        if out:
            shuffle.append(items[index])
            shuffle.append(items[half+index])
        else:
            shuffle.append(items[half+index])
            shuffle.append(items[index])
    return shuffle

def words_with_letters(words, letters):
    """
    10. Subsequent words
    """
    subsequent_words = []
    for word in words:
        index = -1
        w = word
        for letter in letters:
            w = w[index+1:]
            index = w.find(letter)
            if index == -1:
                break
        else:
            subsequent_words.append(word)
    return subsequent_words

def taxi_zum_zum(moves):
    """
    11. Taxi Zum Zum
    """
    direction =[(0, 1), (1, 0), (0, -1), (-1, 0)]
    index = 0
    x, y = 0, 0
    for d in moves:
        if d == 'L':
            index = (index - 1) % 4 
        elif d == 'R':
            index = (index + 1) % 4 
        elif d == 'F':
            x, y = x + direction[index][0], y + direction[index][1]
    return (x, y)

def give_change(amount, coins):
    """
    12. Exact change only
    """
    changes = []
    for coin in coins:
        while amount >= coin:
            amount -= coin
            changes.append(coin)
    return changes

def safe_squares_rooks(n, rooks):
    """
    13. Rooks on a rampage
    """
    row = set()
    column = set()
    for rook in rooks:
        row.add(rook[0])
        column.add(rook[1])
    return (n-(len(row)))*(n-len(column))

def words_with_given_shape(words, shape):
    """
    14. Words with given shape
    """
    words_with_shape = []
    for word in words:
        if len(word)-1 == len(shape):
            word_shape = []
            for w in itertools.pairwise(word):
                if w[0] == w[1]:
                    word_shape.append(0)
                else:
                    word_shape.append(1 if w[0]<w[1] else -1)
            if word_shape == shape:
                words_with_shape.append(word)    
    return words_with_shape

def is_left_handed(pips):
    """
    15. Chirality
    """
    if sorted(pips) not in [[1,2,3],[1,2,4],[1,3,5],[4,5,6]]:
        return False
    return pips[0]<pips[1]<pips[2] or pips[2]<pips[0]<pips[1] or pips[1]<pips[2]<pips[0] 
           
def winning_card(cards, trump=None):
    """
    16. The card that wins the trick
    """
    suits = {'clubs': 4, 'diamonds': 3, 'hearts': 2, 'spades': 1}
    ranks = {'two': 2, 'three': 3, 'four': 4, 'five': 5, 'six': 6, 'seven': 7, 'eight': 8,
         'nine': 9, 'ten': 10, 'jack': 11, 'queen': 12, 'king': 13, 'ace': 14}
    winner = None
    for card in cards:
        if winner is None: 
            winner = card
            if not trump:
                trump = card[1]
        elif card[1]==trump and (winner[1] != trump or ranks[winner[0]]<ranks[card[0]]):
            winner = card
        elif winner[1]==card[1] and ranks[winner[0]]<ranks[card[0]]:
            winner = card
    return winner
