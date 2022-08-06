from time import sleep


def fibo_gen(n=None):
    a, b = 0, 1
    counter = 0
    while not n or counter < n:
        if counter == 0:
            counter += 1
            yield a
        elif counter == 1:
            counter += 1
            yield b
        else:
            current = a + b
            a, b = b, current
            counter += 1
            yield current


if __name__ == '__main__':
    try:
        n = int(input(
            'Enter number of fibonacci numbers to generate (write 0 to infinite numbers): '))
    except ValueError:
        print('Invalid input')
        exit()
    fibonacci = fibo_gen(n)
    for element in fibonacci:
        print(element)
        sleep(0.4)