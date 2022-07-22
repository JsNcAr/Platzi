def main():
    squared_not_module_3 = [num ** 2 for num in range(1, 101) if num % 3 != 0]
    multiple = [num*4 for num in range(1, int(100000/4)+1) if num*4 % 18 == 0]

    print(multiple)


if __name__ == '__main__':
    main()
