import random as rd
from unidecode import unidecode as ud
import os
import sys


def clear():
    if sys.platform == 'win32':
        os.system('cls')
    else:
        os.system('clear')


def princ(print_word):
    clear()
    print('Welcome to Hangman!')
    print(print_word)
    print('\n(Write exit to exit the game.)')


def main():
    words = []
    # Get the words from the file
    with open('./Data/data.txt', 'r', encoding='utf-8') as f:
        for line in f:
            # ud normalizes the strings to remove accents and spaces
            words.append(ud(line.strip()))

    # Select random word to be guessed
    word = rd.choice(words)

    # Create word to be printed on screen
    print_word = '_' * len(word)

    finish = False
    princ(print_word)

    while not finish:

        guess = input('\nGuess a letter: ').lower()
        try:
            if len(guess) > 1 or not guess.isalpha():
                if guess=='exit':
                    finish=True
                    break
                else:
                    raise ValueError
        except ValueError:
            princ(print_word)
            print('Invalid input!')
            continue
        else:
            if guess in word:
                new_word = ''
                for i in range(len(print_word)):
                    if print_word[i] == '_':
                        if guess == word[i]:
                            new_word += guess
                        else:
                            new_word += '_'
                    else:
                        new_word += print_word[i]
                print_word = new_word
                princ(print_word)
                print('Correct!')
            else:
                princ(print_word)
                print('Incorrect!')

            if print_word == word:
                finish = True
                print('You win!')


if __name__ == '__main__':
    main()
