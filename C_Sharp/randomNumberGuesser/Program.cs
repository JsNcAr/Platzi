// See https://aka.ms/new-console-template for more information
public class Program
{
    public void RandomNumberGuessingGame(int max)
    {
        Random random = new Random();
        int randomNumber = random.Next(1, max);
        int userGuess = 0;
        int numberOfGuesses = 0;
        bool correctGuess = false;

        Console.WriteLine($"I'm thinking of a number between 1 and {max}. Can you guess what it is?");

        while (correctGuess == false)
        {
            Console.Write("Enter your guess: ");
            userGuess = Convert.ToInt32(Console.ReadLine());
            numberOfGuesses++;

            if (userGuess == randomNumber)
            {
                correctGuess = true;
            }
            else if (userGuess < randomNumber)
            {
                Console.WriteLine("Your guess is too low. Try again.");
            }
            else if (userGuess > randomNumber)
            {
                Console.WriteLine("Your guess is too high. Try again.");
            }
        }

        Console.WriteLine("Congratulations! You guessed the number in {0} tries.", numberOfGuesses);
    }
    public static void Main(string[] args)
    {
        Program program = new();
        Console.WriteLine("Welcome to the Random Number Guessing Game!");
        Console.Write("Enter the maximum number you want to guess: ");
        int max = Convert.ToInt32(Console.ReadLine());
        program.RandomNumberGuessingGame(max);
    }
}
