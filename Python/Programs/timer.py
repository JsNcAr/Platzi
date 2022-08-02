from datetime import datetime

def execution_time(func):
    def wrapper():
        initial_time = datetime.now()
        func()
        final_time = datetime.now()
        print(f'Execution time: {(final_time - initial_time).total_seconds()} seconds')
    return wrapper