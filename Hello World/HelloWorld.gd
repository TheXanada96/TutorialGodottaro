extends Node2D

# Variabili globali
var a = 2
var b = 3 # variabile globale
var contatore : int = 0

# Altri tipi di variabili
var numero = 52
var virgola = 56.65
var numeroSpecificato: int = 45
var numeroVirgolettato: float = 9.99969
var stringaProva: String = "Obama"
var boolProva: bool = false
var obama: Object = null

# Enumerazione per gli stati del giocatore
enum StatoGiocatore { VIVO, FERITO, MORTO }

# Dizionario e Array di esempio
var punteggi: Dictionary = {
	"Giocatore1": 100,
	"Giocatore2": 150,
	"Giocatore3": 80
}

var numeriArray: Array = [1, 2, 3, 4, 5]

# Export di variabili per l'editor
export (int) var ses
export (String, DIR) var cartellaEsterna
export (String, FILE, "*.png") var fileEsterno

func somma(a,b):
	return a * b # Variabili locali

func sommaDue(a : String, b: String) -> String:
	return a + " " + b

func _ready():  # Funzione di partenza
	print(numero)
	print(virgola)
	print(a + b)
	print(somma(2, 5))
	print(sommaDue("Sesso", "Turkmeno"))

	print(ifEcoseVarie())

	# Stampa gli stati dei giocatori usando l'enumerazione
	print("Stati dei giocatori:")
	print(StatoGiocatore.VIVO)
	print(StatoGiocatore.FERITO)
	print(StatoGiocatore.MORTO)

	print("Punteggi:", punteggi)
	print("Numeri nell'array:", numeriArray)

	# Ciclo for che itera sull'array
	for i in range(numeriArray.size()):
		print("Indice:", i, "Valore:", numeriArray[i])

	# Ciclo for each per iterare sul dizionario
	for chiave in punteggi.keys():
		print("Giocatore:", chiave, "Punteggio:", punteggi[chiave])

	pass

# Funzione che contiene esempi di if, elif, else, and, or, while, continue, break
func ifEcoseVarie():
	var voto = 75
	if voto >= 90:
		print("Voto eccellente!")
	elif voto >= 80:
		print("Voto molto buono.")
	else:
		print("Voto sufficiente.")

	var eta = 18
	var ha_patente = true

	if eta >= 18 and ha_patente:
		print("Puoi guidare!")
	else:
		print("Non puoi guidare.")

	var giorno = "sabato"
	var tempo = "soleggiato"

	if giorno == "sabato" or tempo == "soleggiato":
		print("È un bel sabato!")
	else:
		print("Forse dovresti restare a casa.")

	# Ciclo while
	while contatore < 5:
		print("Contatore:", contatore)
		contatore += 1

	# Ciclo for each con continue e break
	for numero in numeriArray:
		if numero == 3:
			continue
		if numero == 5:
			break
		print(numero)

	# Commento multilinea
	"""
	LEZZO questo è un commento multilinea!!!!
	ZEB89 è FIERO MAONNA
	"""
	return "Fine della funzione"
