import time


class FiboIterator:
    def __iter__(self):
        self.a = 0
        self.b = 1
        self.counter = 0
        return self

    def __next__(self):
        if self.counter == 0:
            self.counter += 1
            return self.a
        elif self.counter == 1:
            self.counter += 1
            return self.b
        else:
            self.current = self.a+self.b
            self.a, self.b = self.b, self.current
            self.counter += 1
            return self.current


if __name__ == '__main__':
    fibonacci = FiboIterator()
    for element in fibonacci:
        print(element)
        time.sleep(0.5)