// Función para crear una baraja de cartas
function createDeck() {
    // Categorías numéricas del 1 al 10
    const numberCategories = Array.from(Array(10).keys(), i => i + 1)

    // Categorías de letras
    const letterCategories = ['J', 'Q', 'K', 'A']

    // Combinación de categorías numéricas y de letras
    const categories = numberCategories.concat(letterCategories)

    // Palos de las cartas
    const suits = ['hearts', 'spades', 'diamonds', 'clubs']

    // Array que almacenará todas las cartas de la baraja
    const cards = [];

    // Generación de cartas combinando categorías y palos
    for (category of categories) {
        for (suit of suits) {
            cards.push(`${category} ${suit}`)
        }
    }

    // Devuelve la baraja completa
    return cards;
}

// Función para barajar las cartas de una baraja
function deckShuffle(cards) {
    // Crear un array de índices para realizar el seguimiento durante la mezcla
    let indexes = Array.from(Array(cards.length).keys())

    // Array que almacenará las cartas mezcladas
    let shuffledCards = []

    // Mientras hayan índices disponibles
    while (indexes.length > 0) {
        // Seleccionar un índice aleatorio
        let randomIndex = Math.floor(Math.random() * indexes.length);

        // Agregar la carta correspondiente al array mezclado
        shuffledCards.push(cards[randomIndex])

        // Eliminar el índice utilizado para evitar duplicados
        indexes.splice(randomIndex, 1)
    }

    // Devuelve las cartas mezcladas
    return shuffledCards;
}

// Función para repartir cartas entre dos jugadores
function dealCards(numberCards, deck) {
    // Verificar si hay suficientes cartas en la baraja para el reparto
    if (numberCards > deck.length / 2) {
        return 'No hay suficientes cartas en la baraja'
    }

    // Barajar las cartas antes de repartir
    let shuffledCards = deckShuffle(deck)

    // Arrays para almacenar las cartas de cada jugador
    let player1 = []
    let player2 = []

    // Repartir cartas alternadamente entre los jugadores
    for (let i = 0; i < numberCards; i++) {
        player1.push(shuffledCards[i])
        player2.push(shuffledCards[i + 1])
    }

    // Crear un diccionario para representar los jugadores y sus cartas
    let playerDict = {}
    playerDict['player1'] = player1
    playerDict['player2'] = player2

    // Devolver el diccionario con las cartas repartidas
    return playerDict
}

// Ejemplo de uso: Repartir 5 cartas a dos jugadores con una nueva baraja
const dealtCards = dealCards(5, createDeck())
console.log(dealtCards)
