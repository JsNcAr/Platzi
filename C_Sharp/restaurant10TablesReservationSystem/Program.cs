
string[] users = new string[10];
int arrayIndex = 0;

Console.WriteLine("Welcome to the restaurant reservation system");

while (arrayIndex < 10)
{
    Console.WriteLine("Please enter your username");
    string username = Console.ReadLine();

    if (Array.IndexOf(users, username) > -1)
    {
        Console.WriteLine("Welcome back " + username);
    }
    else
    {
        users[arrayIndex] = username;
        Console.WriteLine("Welcome " + username + " you are user number " + (arrayIndex + 1));
        arrayIndex++;
    }
}

Console.WriteLine("The restaurant is full");

foreach (string element in users)
{
    Console.WriteLine(element);
}

Environment.Exit(0);