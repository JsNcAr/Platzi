use regex::Regex;
use std::io;

fn main() {
    let re_add = Regex::new(r"(-?\d+)\s*\+\s*(-?\d+)").unwrap();
    let re_subs = Regex::new(r"(-?\d+)\s*\-\s*(-?\d+)").unwrap();
    let re_mult = Regex::new(r"(-?\d+)\s*\*\s*(-?\d+)").unwrap();
    let re_div = Regex::new(r"(-?\d+)\s*\/\s*(-?\d+)").unwrap();
    // Regex to check parentheses
    let re_parentheses = Regex::new(r"\(([^()]*)\)").unwrap();

    // Get user data
    println!("Enter an operation:");
    let mut input = String::new();

    // Apply Operation
    io::stdin()
        .read_line(&mut input)
        .expect("Failed to read line");

    // Make operation in parentheses
    let mut new_input: String = input.clone();
    let mut operation: String = String::new();

    if re_parentheses.is_match(&input) {
        println!("Input: {}", input);
        for caps in re_parentheses.captures_iter(&input) {
            operation = caps[1].to_string();
            loop {
                let (operation_name, re) = get_operation(&operation);
                if operation_name == "none" {
                    // Replace specific parentheses
                    new_input = re_parentheses.replace(&new_input, &operation).to_string();
                    println!("Parenthesis: {}", new_input);
                    break;
                }
                let result = apply_operation(&operation, operation_name, re);
                operation = result.to_string();
            }
        }
    }
    if re_mult.is_match(&input) {
        loop {
            let (operation_name, re) = ("mult", re_mult.clone());
            let result = apply_operation(&new_input, operation_name, re);
            new_input = result.to_string();
            if !re_mult.is_match(&new_input) {
                println!("Mult: {}", new_input);
                break;
            }
        }
    }
    if re_div.is_match(&input) {
        loop {
            let (operation_name, re) = ("div", re_div.clone());
            let result = apply_operation(&new_input, operation_name, re);
            new_input = result.to_string();
            if !re_div.is_match(&new_input) {
                println!("Div: {}", new_input);
                break;
            }
        }
    }
    if re_add.is_match(&input) || re_subs.is_match(&input) {
        loop {
            let (operation_name, re) = get_operation(&new_input);
            if operation_name == "none" {
                break;
            }
            let result = apply_operation(&new_input, operation_name, re);
            println!("Result: {}", result);
            new_input = result.to_string();
        }
    }

    println!("Result: {}", new_input);
}

fn get_operation(input: &str) -> (&str, Regex) {
    let re_add = Regex::new(r"(-?\d+)\s*\+\s*(-?\d+)").unwrap();
    let re_subs = Regex::new(r"(-?\d+)\s*\-\s*(-?\d+)").unwrap();
    let re_mult = Regex::new(r"(-?\d+)\s*\*\s*(-?\d+)").unwrap();
    let re_div = Regex::new(r"(-?\d+)\s*\/\s*(-?\d+)").unwrap();
    let re_void = Regex::new(r"(\d+)").unwrap();

    if re_mult.is_match(&input) {
        return ("mult", re_mult);
    } else if re_div.is_match(&input) {
        return ("div", re_div);
    } else if re_add.is_match(&input) || re_subs.is_match(&input) {
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
    } else {
        return ("none", re_void);
    }
}

fn apply_operation(input: &str, operation: &str, re: Regex) -> String {
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
