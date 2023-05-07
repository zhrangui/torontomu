import pytest
from labs109 import *

WORDS_WITH_LETTERS = "words_sorted.txt"

def test_is_ascending():
    assert is_ascending([-5, 10, 99, 123456])

def test_words_with_letters():
    with open(WORDS_WITH_LETTERS, 'r') as f:
        words = [line.strip() for line in f.readlines()]
    assert words_with_letters(words, 'brohiic')

def test_riffle():
    assert riffle([1, 2, 3, 4, 5, 6, 7, 8]) == [1, 5, 2, 6, 3, 7, 4, 8]

def test_taxi_zum_zum():
    assert taxi_zum_zum("RLLFLF") == (-1, 1)

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
