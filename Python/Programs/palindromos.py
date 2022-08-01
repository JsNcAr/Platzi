def is_palindrome(word: str) -> bool:
    try:
        if len(word) == 0:
            message="La palabra no puede ser vacía"
            raise ValueError("La palabra no puede ser vacía")
        if word.isnumeric():
            message="La palabra no puede ser un número"
            raise ValueError("La palabra no puede ser un número")

        else:

            word = word.replace(' ', '').lower()

            if word == word[::-1]:
                return True
            else:
                return False

    except ValueError:
        print(message)
        return False


def main():
    word = input("Introduce una palabra: ")
    print(is_palindrome(word))


if __name__ == '__main__':
    main()
