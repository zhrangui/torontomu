# As an example, here is an implementation of
# the first problem "Ryerson Letter Grade":
import sys
import math
from itertools import combinations

sys.set_int_max_str_digits(0)


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
    for i in range(1, len(items)):
        if items[i-1] >= items[i]:
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


def domino_cycle(tiles):
    """
    6. Domino cycle
    """
    for i in range(len(tiles)):
        if tiles[i-1][1] != tiles[i][0]:
            return False
    return True


def colour_trio(colours):
    """
    7. Colour trio
    """
    clrs = {'b': 0, 'r': 1, 'y': 2}
    clrIndex = list(clrs.keys())
    while len(colours) > 1:
        new_colours = ''
        for i in range(1, len(colours)):
            if colours[i-1] == colours[i]:
                new_colours += colours[i]
            else:
                colour = clrIndex[-(clrs[colours[i-1]]+clrs[colours[i]]) % 3]
                new_colours += colour
        colours = new_colours
    return colours


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
    direction = [(0, 1), (1, 0), (0, -1), (-1, 0)]
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
            for i in range(len(word)):
                if i == 0:
                    continue
                if word[i-1] == word[i]:
                    word_shape.append(0)
                else:
                    word_shape.append(1 if word[i-1] < word[i] else -1)
            if word_shape == shape:
                words_with_shape.append(word)
    return words_with_shape


def is_left_handed(pips):
    """
    15. Chirality
    """
    if sorted(pips) not in [[1, 2, 3], [1, 2, 4], [1, 3, 5], [4, 5, 6]]:
        return False
    return pips[0] < pips[1] < pips[2] or pips[2] < pips[0] < pips[1] or pips[1] < pips[2] < pips[0]


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
        elif card[1] == trump and (winner[1] != trump or ranks[winner[0]] < ranks[card[0]]):
            winner = card
        elif winner[1] == card[1] and ranks[winner[0]] < ranks[card[0]]:
            winner = card
    return winner


def knight_jump(knight, start, end):
    """
    17. Do you reach many, do you reach one?
    """
    substract = tuple(sorted([abs(x - y)
                              for x, y in zip(start, end)], reverse=True))
    return substract == knight


def seven_zero(n):
    """
    18. Sevens rule, zeros drool
    """
    def generate70(d):
        seven_zero = 0
        k = 1
        while k <= d:
            seven_zero += 7*10**(d-k)
            yield seven_zero
            k += 1

    length = len(str(n))
    div5_2 = n % 5 == 0 or n % 2 == 0

    while length > 0:
        if div5_2:
            seven_zeros = generate70(length)
            for sz in seven_zeros:
                if sz % n == 0:
                    return sz
        else:
            seven_zero = int("7"*length)
            if seven_zero % n == 0:
                return seven_zero

        length += 1


def can_balance(items):
    """
    19. Fulcrum
    """
    if len(items) <= 1:
        return 0
    for index in range(1, len(items)):
        left, right = 0, 0
        for i, item in enumerate(items[:index]):
            left += item*(index-i)
        for i, item in enumerate(items[index+1:]):
            right += item*(i+1)
        if left == right:
            return index
        left, right = 0, 0
    return -1


def josephus(n, k):
    """
    20. Fail while daring greatly
    """
    rest = list(range(1, n+1))
    final = []
    index = 0
    while rest:
        index = (index-1 + k) % len(rest)
        final.append(rest[index])
        del rest[index]
    return final


def group_and_skip(n, out, ins):
    """
    21. All your bases are belong to us
    """
    number = []
    while n >= out:
        number.append(n % out)
        n = ins*(n//out)
    if n > 0:
        number.append(n)
    return number


def pyramid_blocks(n, m, h):
    """
    22. Count the balls off the brass monkey
    """
    sum = h*m*n + h*(h-1)//2*(m+n) + ((h-1) * h * (2 * (h-1) + 1)) // 6
    return sum


def count_growlers(animals):
    """
    23. Count growlers
    """
    count = 0
    for i, animal in enumerate(animals):
        growl = 0
        if animal in ['cat', 'dog']:
            face = animals[:i]
        else:
            face = animals[i+1:]
        for a in face:
            if a in ['dog', 'god']:
                growl += 1
            else:
                growl -= 1
        if growl > 0:
            count += 1
    return count


def bulgarian_solitaire(piles, k):
    """
    24. Bulgarian solitair
    """
    new_piles = []
    count = 0
    while not all(n in piles for n in range(1, k+1)):
        new_piles = []
        for p in piles:
            if p > 1:
                new_piles.append(p-1)
        new_piles.append(len(piles))
        piles = new_piles
        count += 1
    return count


def scylla_or_charybdis(moves, n):
    """
    25. Scylla or Charybdis?
    """
    ns = []
    k = 0
    for i, move in enumerate(moves):
        if move == "+":
            k += 1
        else:
            k -= 1
        if abs(k) == n - 1:
            ns.append(i)
    return ns


def arithmetic_progression(items):
    """
    26. Longest arithmetic progression
    """
    counts = {}
    starts = {}
    for i in range(1, len(items)):
        stride = items[i] - items[i-1]
        if not stride in counts:
            starts[stride] = items[i-1]
        counts[stride] = counts.get(stride, 0) + 1
    max_key = max(counts, key=lambda k: counts[k])
    return [starts[max_key], max_key, counts[max_key]]


def tukeys_ninthers(items):
    """
    27. Best one out of three
    """
    while len(items) > 1:
        medians = []
        for i in range(len(items)//3):
            index = i*3
            medians.append(sorted(items[index:index+3])[1])
        items = medians

    return items[0]


def collect_numbers(perm):
    """
    28. Collecting numbers
    """


def verify_betweenness(perm, constraints):
    """
    29. Between the soft and the NP-hard place
    """
    pass


def count_troikas(items):
    """
    30. Count Troikanoff, I presume
    """
    same_items = {}
    for i, item in enumerate(items):
        if item in same_items:
            same_items[item].append(i)
        else:
            same_items[item] = [i]
    count = 0
    for item in same_items:
        if len(same_items[item]) > 2:
            all = combinations(same_items[item], 3)
            for cb in all:
                st = sorted(cb)
                if st[1] - st[0] == st[2]-st[1]:
                    count += 1
    return count


def crag_score(dice):
    """
    31. Crack the crag
    """
    dice = sorted(dice)
    if sum(dice) == 13:
        if dice[0] == dice[1] or dice[1] == dice[2]:
            return 50
        else:
            return 26
    elif dice[0] == dice[1] == dice[2]:
        return 25
    elif dice == [1, 2, 3] or dice == [4, 5, 6] or dice == [1, 3, 5] or dice == [2, 4, 6]:
        return 20

    return max(dice.count(6)*6, dice.count(5)*5, dice.count(4)*4,
               dice.count(3)*3, dice.count(2)*2, dice.count(1))


def three_summers(items, goal):
    """
    32. Three summers ago
    """
    def two_summers(items, goal, i=0, j=None):
        j = len(items)-1 if j is None else j
        while i < j:
            x = items[i] + items[j]
            if x == goal:
                return True
            elif x < goal:
                i += 1
            else:
                j -= 1
        return False

    for i in range(1, len(items)):
        if two_summers(items[i:], goal-items[i-1]):
            return True
    return False


def sum_of_two_squares(n):
    """
    33. Sum of two squares
    """
    i = 1
    j = int(math.sqrt(n))
    while i <= j:
        x = i**2 + j**2
        if x == n:
            return (j, i)
        elif x < n:
            i += 1
        else:
            j -= 1
    return None


def count_carries(a, b):
    """
    34. Carry on Pythonista
    """
    count = 0
    carry = 0

    while (a != 0 and b != 0) or (carry != 0 and (a == 0 or b == 0)):
        carry = (a % 10 + b % 10 + carry)//10
        if carry > 0:
            count += 1
        a = a // 10
        b = b // 10
    return count


def leibniz(heads, positions):
    """
    35. As below, so above
    """


def expand_intervals(intervals):
    """
    36. Expand positive integer intervals
    """
    integers = []
    for interval in intervals.split(','):
        ns = interval.split('-')
        if len(ns) > 1 and ns[0] and ns[1]:
            integers += list(range(int(ns[0]), int(ns[1])+1))
        elif ns[0]:
            integers.append(int(ns[0]))
    return integers


def collapse_intervals(items):
    """
    37. Collapse positive integer intervals 
    """
    if not items:
        return ''
    intervals = []
    pre = items[0]
    interval = str(items[0])
    for i in range(1, len(items)):
        if items[i] > pre + 1:
            if int(interval) < pre:
                interval += ('-' + str(pre))
            intervals.append(interval)
            interval = str(items[i])
        pre = items[i]
    else:
        if int(interval) < pre:
            interval += ('-' + str(pre))
        intervals.append(interval)
    return ",".join(intervals)


def prominences(height):
    """
    38. Prominently featured
    """
    peaks = []
    length = len(height)
    maximum = max(height)
    for i in range(length):
        if (i == 0 or (height[i-1] < height[i])) and (i+1 >= length or height[i] > height[i+1]):
            if not height[i]:
                continue
            if height[i] == maximum:
                peaks.append((i, height[i], maximum))
            else:
                llow = 0
                for j in range(i-1, -1, -1):
                    if height[j] > height[i]:
                        llow = min(height[j:i])
                        break

                rlow = 0
                for j in range(i+1, length):
                    if height[j] > height[i]:
                        rlow = min(height[i:j])
                        break

                peaks.append((i, height[i], height[i]-max(llow, rlow)))

    return peaks


def candy_share(candies):
    """
    39. Like a kid in a candy store, except without money
    """
    count = 0
    length = len(candies)
    while True:
        share = False
        for i in range(length):
            if candies[i] > 1:
                candies[i-1] += 1
                candies[i] -= 2
                candies[(i+1) % length] += 1
                share = True

        if share:
            count += 1
        else:
            return count


def duplicate_digit_bonus(n):
    """
    40. Dibs to dubs
    """
    str_n = str(n)
    last = None
    score = 0
    k = 0
    for i in range(len(str_n)):
        if str_n[i] == last:
            k += 1
        else:
            if k > 1:
                score += 10**(k-2)
            last = str_n[i]
            k = 1
    else:
        if k > 1:
            score += 2*10**(k-2)
    return score


def nearest_smaller(items):
    """
    def nearest_smaller(items):
    """
    length = len(items)
    new_items = []
    for i in range(length):
        llow = None
        rlow = None
        for j in range(i-1, -1, -1):
            if items[j] < items[i]:
                llow = items[j]
                break
        for k in range(i, length):
            if items[k] < items[i]:
                rlow = items[k]
                break
        if llow is not None and rlow is not None:
            if i-j > k-i:
                low = items[k]
            elif i-j == k-i:
                low = min(llow, rlow)
            else:
                low = items[j]
        else:
            low = rlow if llow is None else llow

        low = items[i] if low is None else low
        new_items.append(low)
    return new_items


def ordinal_transform(seed, i):
    """
    42. Iterated ordinal transform
    """
    while len(seed) <= i:
        count = {}
        new_seed = []
        for sd in seed:
            c = count.get(sd, 0) + 1
            count[sd] = c
            new_seed.append(c)
        seed = seed + new_seed
    return seed[i]


def squares_intersect(s1, s2):
    """
    43. Interesting, intersecting
    """
    x = not (s1[0]+s1[2] < s2[0] or s2[0]+s2[2] < s1[0])
    y = not (s1[1]+s1[2] < s2[1] or s2[1]+s2[2] < s1[1])
    return x and y


def oware_move(board, house):
    """
    44. So shall you sow
    """
    pass


def remove_after_kth(items, k=1):
    """
    45. That's enough of you!
    """
    count = {}
    new_items = []
    for item in items:
        c = count.get(item, 0)
        if c < k:
            new_items.append(item)
        count[item] = c + 1
    return new_items
