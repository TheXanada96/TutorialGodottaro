extends Node2D

# Variabili globali
var a = 2
var b = 3 
var contatore : int = 0
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

# Funzione che moltiplica due numeri
func somma(a, b):
	return a * b # Variabili locali

# Funzione che concatena due stringhe con uno spazio in mezzo
func sommaDue(a : String, b: String) -> String:
	return a + " " + b

# Funzione di partenza
func _ready():
	print(numero)  # Stampa il valore della variabile 'numero'
	print(virgola)  # Stampa il valore della variabile 'virgola'
	print(a + b)  # Stampa la somma delle variabili globali 'a' e 'b'
	print(somma(2, 5))  # Stampa il risultato della funzione 'somma' con argomenti 2 e 5
	print(sommaDue("Sesso", "Turkmeno"))  # Stampa il risultato della funzione 'sommaDue' con argomenti "Sesso" e "Turkmeno"

	print(ifEcoseVarie())  # Stampa il risultato della funzione 'ifEcoseVarie'

	# Stampa gli stati dei giocatori usando l'enumerazione
	print("Stati dei giocatori: ")
	print(StatoGiocatore.VIVO)
	print(StatoGiocatore.FERITO)
	print(StatoGiocatore.MORTO)

	# Stampa il dizionario 'punteggi'
	print("Punteggi: ", punteggi)
	# Stampa l'array 'numeriArray'
	print("Numeri nell'array: ", numeriArray)

	# Ciclo for che itera sull'array
	for i in range(numeriArray.size()):
		print("Indice: ", i , " Valore: ", numeriArray[i])

	# Ciclo for each per iterare sul dizionario
	for chiave in punteggi.keys():
		print("Giocatore: ", chiave, "Punteggio: ", punteggi[chiave])

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
	Questo è un commento multilinea.
	"""
	return "Fine della funzione"

func _input(event):
	if event.is_action_pressed("ui_cancel"):  # "ui_cancel" è mappato al tasto "Esc" per default
		get_tree().change_scene("res://Avventura Testuale/Il MHANZ Definito.tscn")
