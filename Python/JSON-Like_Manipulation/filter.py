from data import data as dt


def main():
    # Filter the workers who know python
    python_developers = [x['name']
                         for x in dt if x['language'] == 'python']

    # Filter the workers who work in Platzi
    platzi_developers = [x['name']
                         for x in dt if x['organization'] == 'Platzi']

    # Filter the workers who are older than 18
    adults = [x['name'] for x in dt if x['age'] > 18]

    # Add key for developers older than 70
    old_people = list(map(lambda x: x | {'old': x['age'] > 70}, dt))
    old_people_names = [x['name'] for x in old_people if x['old']]
    print(f"{python_developers} \n{platzi_developers} \n{adults} \n{old_people_names}")


if __name__ == '__main__':
    main()
