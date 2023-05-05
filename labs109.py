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