from functools import reduce
def main():
    lista = [1,2,3,4,5,6,7,8,9,10]
    odd = list(filter(lambda x: x % 2 != 0, lista))
    square = list(map(lambda x: x ** 2, lista))
    sum_square = reduce(lambda x, y: x + y, lista)

    print(f"{odd} \n{square} \n{sum_square}")

if __name__ == '__main__':
    main()