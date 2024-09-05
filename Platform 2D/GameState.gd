extends Node2D  # Estende la classe Node2D, quindi questo script è attaccato a un nodo 2D

var lives = 5  # Variabile che tiene traccia del numero di vite del giocatore
var coins = 0  # Variabile che tiene traccia del numero di monete raccolte
var target_number_of_coins = 10  # Numero di monete necessarie per ottenere una vita extra

# Funzione chiamata quando il nodo è pronto
func _ready():
	add_to_group("Gamestate")  # Aggiunge questo nodo al gruppo "Gamestate"
	update_GUI()  # Aggiorna l'interfaccia utente

# Funzione chiamata quando il giocatore viene ferito
func hurt():
	lives -= 1  # Riduce il numero di vite di 1
	$Player2.hurt()  # Chiama la funzione "hurt" sul nodo "Player2"
	update_GUI()  # Aggiorna l'interfaccia utente
	if lives <= 0:  # Se le vite sono minori o uguali a 0
		end_game()  # Chiama la funzione "end_game" per terminare il gioco

# Funzione per aggiornare l'interfaccia utente
func update_GUI():
	get_tree().call_group("GUI", "update_GUI", lives, coins)  # Chiama il metodo "update_GUI" su tutti i nodi nel gruppo "GUI" passando le vite e le monete

# Funzione chiamata quando il giocatore raccoglie una moneta
func coin_up():
	coins += 1  # Aumenta il numero di monete di 1
	update_GUI()  # Aggiorna l'interfaccia utente
	var multiple_of_coins = (coins % target_number_of_coins) == 0  # Controlla se il numero di monete è un multiplo del target
	if multiple_of_coins:  # Se è un multiplo
		life_up()  # Chiama la funzione "life_up" per aumentare le vite

# Funzione per aumentare il numero di vite
func life_up():
	lives += 1  # Aumenta il numero di vite di 1
	update_GUI()  # Aggiorna l'interfaccia utente

# Funzione per terminare il gioco
func end_game():
	get_tree().change_scene("res://Platform 2D/EndGame.tscn")  # Cambia la scena alla schermata di fine gioco

# Funzione per vincere il gioco
func win():
	get_tree().change_scene("res://Platform 2D/Victory.tscn")  # Cambia la scena alla schermata di vittoria

# Funzione chiamata per gestire l'input dell'utente
func _input(event):
	if event.is_action_pressed("ui_cancel"):  # "ui_cancel" è mappato al tasto "Esc" per default
		get_tree().change_scene("res://Avventura Testuale/Il MHANZ Definito.tscn")  # Cambia la scena alla scena specificata
