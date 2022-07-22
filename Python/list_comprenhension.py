def main():
    squared_not_module_3 = [num ** 2 for num in range(1, 101) if num % 3 != 0]

    print(squared_not_module_3)

if __name__ == '__main__':
    main()