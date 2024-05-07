use regex::Regex;
use std::io;

fn main() {
    // Obtener nombre
    println!("Por favor, ingresa tu nombre: ");
    let mut name = String::new();
    io::stdin().read_line(&mut name).unwrap_or_default();
    let name: &str = name.trim();

    // Obtener edad
    println!("Por favor, ingresa tu edad: ");
    let mut age = String::new();
    io::stdin().read_line(&mut age).unwrap_or_default();
    let edad: u8 = age
        .trim()
        .parse()
        .expect("Por favor, ingresa una edad válida");

    // Revisar si edad es suficiente para tomar
    if edad >= 18 {
        println!("Hola, {} puedes tomar cerveza", name);
    } else {
        println!("Hola, {} no puedes tomar cerveza", name);
    }
}
