extends Control

var label : Label

func _ready():
	# Ottieni un riferimento al nodo Label
	label = $Label

	# Chiamato quando il programma viene avviato
	_on_program_start()

func _on_program_start():
	# Conta i caratteri nel testo del Label
	var testoLabel : String = label.text
	var lunghezzaTesto : int = testoLabel.length()

	# Stampa il risultato nella console di Godot
	print("Numero di caratteri nel Label:", lunghezzaTesto)
