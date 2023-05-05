import pytest
from labs109 import *

WORDS_WITH_LETTERS = "words_sorted.txt"

def test_words_with_letters():
    with open(WORDS_WITH_LETTERS, 'r') as f:
        words = [line.strip() for line in f.readlines()]
    assert words_with_letters(words, 'brohiic')

def test_taxi_zum_zum():
    assert taxi_zum_zum("RLLFLF") == (-1, 1)

def test_give_change():
    assert give_change(64, [50, 25, 10, 5, 1] ) == [50, 10, 1, 1, 1, 1]

def test_safe_squares_rooks():
    assert safe_squares_rooks(4, [(2, 3), (0, 1)]) == 4

def test_words_with_given_shape():
    assert words_with_given_shape(['congeed'], [1, -1, -1, -1, 0, -1]) == ['congeed']
