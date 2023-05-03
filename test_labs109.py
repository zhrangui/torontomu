import pytest
from labs109 import *

WORDS_WITH_LETTERS = "words_sorted.txt"

def test_words_with_letters():
    with open(WORDS_WITH_LETTERS, 'r') as f:
        words = [line.strip() for line in f.readlines()]
    assert words_with_letters(words, 'brohiic')

def test_taxi_zum_zum():
    assert taxi_zum_zum("RLLFLF") == (-1, 1)