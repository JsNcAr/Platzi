def main():
    my_list = [1, "Hello", True, 4.5]
    my_dict = {"first_name": "Jason", "last_name": "Arias"}

    super_list = [
        {"first_name": "Jason", "last_name": "Arias"},
        {"first_name": "Camilo", "last_name": "Torres"},
        {"first_name": "Arturo", "last_name": "Calle"},
        {"first_name": "Rodolfo", "last_name": "Arias"}
        ]
    
    super_dict = {
        "natural_nums": [1, 2, 3, 4, 5],
        "integer_nums": [-1, -2, 0, 1, 2],
        "float_nums": [1.1, 2.2, 3.3, 4.4],
    }

    for key, value in super_dict.items():
        print(f"{key}: {value}")

if __name__ == '__main__':
    main()