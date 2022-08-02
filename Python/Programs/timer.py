from datetime import datetime

def execution_time(func):
    def wrapper(*args, **kwargs):
        initial_time = datetime.now()
        func(*args, **kwargs)
        final_time = datetime.now()
        print(f'Execution time: {(final_time - initial_time).total_seconds()} seconds')
    return wrapper