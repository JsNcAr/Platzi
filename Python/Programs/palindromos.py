def palindromo(word: str) -> bool:
    try:
        if len(word) <= 1:
            if word == word[::-1]:
                return True
            else:
                return False
        else:
            raise ValueError
    except ValueError:
        print("Error: El valor introducido no es una palabra")
        return False

def main():
    pass    

if __name__ == '__main__':
    main()