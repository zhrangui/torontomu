import pytest
from labs109 import *

WORDS_WITH_LETTERS = "words_sorted.txt"

def test_is_ascending():
    assert is_ascending([-5, 10, 99, 123456])

def test_words_with_letters():
    with open(WORDS_WITH_LETTERS, 'r') as f:
        words = [line.strip() for line in f.readlines()]
    assert words_with_letters(words, 'brohiic')

def test_domino_cycle():
    assert domino_cycle([(3, 5), (5, 2), (2, 3)])

def test_only_odd_digits():
    assert only_odd_digits(1357975313579) 

def test_colour_trio():
    assert colour_trio('rybyry') == 'r'

def test_riffle():
    assert riffle([1, 2, 3, 4, 5, 6, 7, 8]) == [1, 5, 2, 6, 3, 7, 4, 8]

def test_taxi_zum_zum():
    assert taxi_zum_zum("RFRL") == (1, 0)

def test_give_change():
    assert give_change(64, [50, 25, 10, 5, 1] ) == [50, 10, 1, 1, 1, 1]

def test_safe_squares_rooks():
    assert safe_squares_rooks(4, [(2, 3), (0, 1)]) == 4

def test_words_with_given_shape():
    assert words_with_given_shape(['congeed'], [1, -1, -1, -1, 0, -1]) == ['congeed']

def test_is_left_handed():
    assert not is_left_handed([1, 2, 4])

def test_winning_card():
    assert winning_card([('two', 'hearts'), ('nine', 'spades'), ('two', 'clubs'), ('ace', 'spades')], 'clubs') == ('two', 'clubs')

def test_knight_jump():
    assert knight_jump((7, 5, 1), (15, 11, 16), (8, 12, 11)) 

def test_seven_zero():
    assert seven_zero(42) == 7770

def test_can_balance():
    assert can_balance([6, 1, 10, 5, 4]) == 2

def test_josephus():
    assert josephus(4, 2) == [2, 4, 3, 1]

def test_group_and_skip():
    assert group_and_skip(13, 3, 2) == [1, 2, 1, 2]

def test_pyramid_blocks():
    assert pyramid_blocks(2, 3, 10) == 570

def test_count_growlers():
    assert count_growlers(['god', 'cat', 'cat', 'tac', 'tac', 'dog', 'cat', 'god']) == 2

def test_bulgarian_solitaire():
    assert bulgarian_solitaire([8, 3, 3, 1], 5) == 9

def test_scylla_or_charybdis():
    assert scylla_or_charybdis('-++--++-++++', 2) == 3

def test_arithmetic_progression():
    assert arithmetic_progression([2, 4, 6, 7, 8, 12, 17]) == (2, 2, 4)

def test_tukeys_ninthers():
    assert tukeys_ninthers([42, 7, 15]) == 15

def test_collect_numbers():
    assert collect_numbers([0, 1, 2, 3, 4, 5]) == 1

def test_verify_betweenness():
    assert verify_betweenness(p[5, 2, 0, 3, 1, 4],[(4, 3, 5), (2, 0, 4), (2, 1, 4), (1, 2, 5), (4, 0, 5)])

def test_count_troikas():
    assert  count_troikas([-8, -8, -8, -18, -8, 13, -8]) == 3

def test_crag_score():
    assert crag_score([1, 2, 3]) == 20

def test_three_summers():
    assert not three_summers([2, 3, 5, 10], 14)

def test_sum_of_two_squares():
    assert sum_of_two_squares(50) == (7, 1)

def test_count_carries():
    assert count_carries(99999, 1) == 5

def leibniz(heads, positions):
    assert leibniz([1, -1, 1, -1], range(4)) == [-1, 2, -4, 8]

def test_expand_intervals():
    assert expand_intervals('4-6,10-12,16') == [4, 5, 6, 10, 11, 12, 16]

def test_collapse_intervals():
    assert collapse_intervals([2, 3, 8, 11, 12]) == '2-3,8,11-12'

def test_prominences():
    assert prominences([3, 1, 4]) == [(0, 3, 2), (2, 4, 4)]

def test_candy_share():
    assert candy_share([4, 0, 0, 0, 0, 1]) == 6

def test_duplicate_digit_bonus():
    assert duplicate_digit_bonus(43333) == 200

def test_nearest_smaller():
    assert nearest_smaller([-8, -7, 0, -12, 8]) == [-12, -8, -12, -12, -12]

def test_ordinal_transform():
    assert ordinal_transform([1, 1, 6, 4], 30) == 2

def test_squares_intersect():
    assert squares_intersect((1, -5, 3), (0, -2, 3))

def test_oware_move(board, house):
    assert oware_move([0, 2, 1, 2], 1) == [0, 0, 0, 0]

def test_remove_after_kth():
    assert remove_after_kth([42, 42, 42, 42, 42, 42, 42], 3) == [42, 42, 42]

def test_brussels_choice_step():
    assert  brussels_choice_step(42, 1, 2) == [21, 22, 41, 44, 82, 84]

def test_count_corners():
    assert count_corners([(0, 0), (0, 4), (0, 6), (2, 4), (4, 0)]) == 2

def test_mcculloch():
    assert mcculloch('4524938') == '83948394'

def test_first_preceded_by_smaller():
    assert first_preceded_by_smaller([11, 7, 1, 9, 11], 1) == 9

def test_eliminate_neighbours():
    assert eliminate_neighbours([8, 3, 4, 1, 7, 2, 6, 5]) == 3

def test_count_and_say():
    assert count_and_say('333388822211177') == '4338323127'

def test_safe_squares_bishops():
    assert safe_squares_bishops(4, [(2, 3), (0, 1)]) == 11

def test_word_height():
    with open(WORDS_WITH_LETTERS, 'r') as f:
        words = [line.strip() for line in f.readlines()]
    assert word_height(words, 'chukker') == 1