use regex::Regex;
use std::io;

fn main() {
    // Get user data
    println!("Enter an operation:");
    let mut input = String::new();

    // Read user input
    io::stdin()
        .read_line(&mut input)
        .expect("Failed to read line");

    // Do parentheses operations first
    let mut new_input = solve_parentheses(input.clone());

    // Loop until there are no more operations
    loop {
        let (operation_name, re) = get_operation(&new_input);
        if operation_name == "none" {
            break;
        }
        let result = apply_operation(&new_input, operation_name, re);
        new_input = result.to_string();
    }

    // Cast to i32
    let new_input: i32 = new_input
        .trim()
        .parse()
        .expect("Invalid operation, please try again");

    // Print the result
    println!("\nResult: {}", new_input);
}

// Function to solve operations inside parentheses and return the expression without parentheses
fn solve_parentheses(input: String) -> String {
    // Regex to find expressions inside parentheses
    let re_parentheses = Regex::new(r"\(([^()]*)\)").unwrap();
    // New variable to store the modified input
    let mut new_input: String = input.clone();

    // Loop until there are no more parentheses
    if re_parentheses.is_match(&input) {
        // Loop through each parentheses and solve it
        for caps in re_parentheses.captures_iter(&input) {
            // Save the full expression inside the parentheses
            let mut operation = caps[1].to_string();
            // Loop until there are no more operations inside the parentheses
            loop {
                // Get the operation and the regex to solve it
                let (operation_name, re) = get_operation(&operation);
                // If there are no more operations, replace the parentheses with the result
                if operation_name == "none" {
                    // Replace the parentheses with the result
                    new_input = re_parentheses.replace(&new_input, &operation).to_string();
                    // Exit the loop
                    break;
                } else {
                    // If there are more operations, solve them
                    let result = apply_operation(&operation, operation_name, re);
                    operation = result.to_string();
                }
            }
        }
    }
    // Return the modified input without parentheses
    return new_input;
}

// Function to get the operations and the regex to solve them
fn get_operation(input: &str) -> (&str, Regex) {
    let re_add = Regex::new(r"(-?\d+)\s*\+\s*(-?\d+)").unwrap(); // Regex to find addition
    let re_subs = Regex::new(r"(-?\d+)\s*\-\s*(-?\d+)").unwrap(); // Regex to find substraction
    let re_mult = Regex::new(r"(-?\d+)\s*\*\s*(-?\d+)").unwrap(); // Regex to find multiplication
    let re_div = Regex::new(r"(-?\d+)\s*\/\s*(-?\d+)").unwrap(); // Regex to find division
    let re_void = Regex::new(r"(\d+)").unwrap(); // Arbitrary regex to return if no operation is found

    // Check which are the first operations we should solve (following the order of operations)
    if re_mult.is_match(&input) {
        return ("mult", re_mult);
    } else if re_div.is_match(&input) {
        return ("div", re_div);
    }
    // For addition and substraction, we need to check which one is closer to the beginning
    else if re_add.is_match(&input) || re_subs.is_match(&input) {
        // Check which operation is closer to the beginning
        let add = re_add.find(&input);
        let subs = re_subs.find(&input);
        if add.is_some() && subs.is_some() {
            let add = add.unwrap();
            let subs = subs.unwrap();
            if add.start() < subs.start() {
                return ("add", re_add);
            } else {
                return ("subs", re_subs);
            }
        } else if add.is_some() {
            return ("add", re_add);
        } else {
            return ("subs", re_subs);
        }
    }
    // If no operation is found, return a value of "none" and a regex that will return the number
    else {
        return ("none", re_void);
    }
}

// Function to apply the operation to the input
fn apply_operation(input: &str, operation: &str, re: Regex) -> String {
    // Replace the operation with the result of the operation
    let result = re.replace_all(input, |caps: &regex::Captures| {
        let a: i32 = caps[1].parse().unwrap();
        let b: i32 = caps[2].parse().unwrap();
        match operation {
            "add" => (a + b).to_string(),
            "subs" => (a - b).to_string(),
            "mult" => (a * b).to_string(),
            "div" => (a / b).to_string(),
            _ => panic!("Invalid operation"),
        }
    });
    return result.to_string();
}
