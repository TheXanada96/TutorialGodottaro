extends Control

# Dichiarazione delle variabili
var player_words = []  # Array per memorizzare le parole inserite dall'utente
#var prompts = ["nome", "aggettivo", "lezzo", "unto"]  # Array di prompt da presentare all'utente
#var story = "Una volta un certo %s %s un obamista %s mi ha chiamato %s perché ero albanese"  # Stringa di storia con segnaposto
#var albanian = story % prompts  # Formattazione della storia con i prompt
"""
var current_story  = {"prompts": ["nome", "aggettivo", "lezzo", "unto"],
		"story": "Una volta un certo %s %s un obamista %s mi ha chiamato %s perché ero albanese"
		}
"""
var current_story
var template = [
	{
	"prompts": ["nome", "aggettivo", "lezzo", "unto"],
	"story": "Una volta un certo %s %s un obamista %s mi ha chiamato %s perché ero albanese"
	},
	{
	"story": "un %s capitalista del cavolo %s chiamato Giovanni Scuderi %s è %s in Corea del Nord",
	"prompts" : ["un articolo", "un nome", "un'aggettivo", "un'altro nome"]
	},
	{
	"story": "Una volta un certo ragazzo %s Salvatore %s mi ha chiamato %s perché avevo una maglia del Milan %s",
	"prompts" : ["un articolo", "un nome", "un'aggettivo", "un'altro nome"]
	},
	{
	"story": "Una volta %s un certo bambino giocherellone %s Marco mi ha chiamato %s amico perché giocavo a %s TF2",
	"prompts" : ["un articolo", "un nome", "un'aggettivo", "un'altro nome"]
	},
	{
	"story": "Un turkmeno %s chiamato Kalash %s è %s in Palestina %s",
	"prompts" : ["un articolo", "un nome", "un'aggettivo", "un'altro nome"]
	},
	{
	"story": "Un %s turco mangiakebab %s mi ha denunciato %s perché si %s",
	"prompts" : ["un articolo", "un nome", "un'aggettivo", "un'altro nome"]
	},
	{
	"story": "Un Curdo %s è scappato in %s Serbia perché lo volevano %s uccedere in Turchia %s",
	"prompts" : ["un articolo", "un nome", "un'aggettivo", "un'altro nome"]
	},
	{
	"story": "Zeb89 %s è arrabbiato %s perché l'ho aggiunto %s nel nostro gioco sudicio %s",
	"prompts" : ["un articolo", "un nome", "un'aggettivo", "un'altro nome"]
	}
	]
	




# Dichiarazione dei nodi UI
onready var PlayerText = $VBoxContainer/HBoxContainer/LineEdit  # Campo di testo per l'input dell'utente
onready var DisplayText = $VBoxContainer/DisplayText  # Elemento di testo per visualizzare la storia e i prompt

# Funzione chiamata quando il nodo è pronto
func _ready(): 
	randomize()
	current_story = template[randi() % template.size()]
	DisplayText.text = "Benvenuto Zeb89! Ci serve il campione mondiale di Serious Sam per distruggere questi obamisti invasori delle terra! "
	check_player_words_lenght()  # Controlla la lunghezza delle parole inserite dall'utente
	PlayerText.grab_focus()


func set_current_story(): 
	randomize()
	current_story = template[randi() % template.size()]

# Funzione chiamata quando l'utente preme Invio nel campo di testo
func _on_LineEdit_text_entered(new_text):
	add_to_player_words()

# Funzione chiamata quando l'utente preme un pulsante
func _on_TextureButton_pressed():
	if is_story_done(): 
		get_tree().reload_current_scene()
	else:
		add_to_player_words()

# Aggiunge le parole inserite dall'utente all'array
func add_to_player_words():
	player_words.append(PlayerText.text)
	DisplayText.text = ""  # Cancella il testo nel campo di testo
	PlayerText.clear()   # Cancella il campo di testo
	check_player_words_lenght()  # Controlla la lunghezza delle parole inserite dall'utente

# Verifica se la storia è completa in base alla lunghezza delle parole inserite
func is_story_done():
	return player_words.size() == current_story.prompts.size()

# Controlla la lunghezza delle parole inserite dall'utente e gestisce di conseguenza
func check_player_words_lenght():
	if is_story_done():  # Se la storia è completa
		end_game()     # Racconta la storia completa
	else:
		prompt_player()  # Altrimenti, chiede all'utente un nuovo prompt

# Racconta la storia completa sostituendo i segnaposto con le parole inserite dall'utente
func tell_story():
	DisplayText.text = current_story.story % player_words

# Chiede all'utente il prossimo prompt da inserire
func prompt_player():
	DisplayText.text += "Posso avere un " + current_story.prompts[player_words.size()] + " per favore?"

func end_game():
	PlayerText.queue_free()
	$VBoxContainer/HBoxContainer/Label.text = "reset"
	tell_story()
