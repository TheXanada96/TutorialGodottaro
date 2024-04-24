extends Control

# Dichiarazione delle variabili
var player_words = []  # Array per memorizzare le parole inserite dall'utente
var prompts = ["nome", "aggettivo", "lezzo", "unto"]  # Array di prompt da presentare all'utente
var story = "Una volta un certo %s %s un obamista %s mi ha chiamato %s perché ero albanese"  # Stringa di storia con segnaposto
var albanian = story % prompts  # Formattazione della storia con i prompt

# Dichiarazione dei nodi UI
onready var PlayerText = $VBoxContainer/HBoxContainer/LineEdit  # Campo di testo per l'input dell'utente
onready var DisplayText = $VBoxContainer/DisplayText  # Elemento di testo per visualizzare la storia e i prompt

# Funzione chiamata quando il nodo è pronto
func _ready(): 
	DisplayText.text = "Benvenuto Zeb89! Ci serve il campione mondiale di Serious Sam per distruggere questi obamisti invasori delle terra! "
	check_player_words_lenght()  # Controlla la lunghezza delle parole inserite dall'utente

# Funzione chiamata quando l'utente preme Invio nel campo di testo
func _on_LineEdit_text_entered(new_text):
	add_to_player_words()

# Funzione chiamata quando l'utente preme un pulsante
func _on_TextureButton_pressed():
	add_to_player_words()

# Aggiunge le parole inserite dall'utente all'array
func add_to_player_words():
	player_words.append(PlayerText.text)
	PlayerText.text = ""  # Cancella il testo nel campo di testo
	PlayerText.clear()   # Cancella il campo di testo
	check_player_words_lenght()  # Controlla la lunghezza delle parole inserite dall'utente

# Verifica se la storia è completa in base alla lunghezza delle parole inserite
func is_story_done():
	return player_words.size() == prompts.size()

# Controlla la lunghezza delle parole inserite dall'utente e gestisce di conseguenza
func check_player_words_lenght():
	if is_story_done():  # Se la storia è completa
		tell_story()     # Racconta la storia completa
	else:
		prompt_player()  # Altrimenti, chiede all'utente un nuovo prompt

# Racconta la storia completa sostituendo i segnaposto con le parole inserite dall'utente
func tell_story():
	DisplayText.text = story % player_words

# Chiede all'utente il prossimo prompt da inserire
func prompt_player():
	DisplayText.text = "Posso avere un " + prompts[player_words.size()] + " per favore?"
