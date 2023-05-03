# As an example, here is an implementation of
# the first problem "Ryerson Letter Grade":

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