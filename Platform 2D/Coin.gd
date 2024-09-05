extends Node2D  # Estende la classe Node2D, quindi questo script è attaccato a un nodo 2D

var taken = false  # Variabile che tiene traccia se l'oggetto è stato preso o no

# Funzione chiamata quando un corpo entra nell'Area2D collegata
func _on_Area2D_body_entered(body):
	if not taken:  # Controlla se l'oggetto non è già stato preso
		taken = true  # Imposta la variabile taken a true, indicando che l'oggetto è stato preso
		$AnimationPlayer.play("coinAnim")  # Riproduce l'animazione chiamata "coinAnim"
		$AudioStreamPlayer2D.play()  # Riproduce l'audio collegato
		get_tree().call_group("Gamestate", "coin_up")  # Chiama il metodo "coin_up" su tutti i nodi nel gruppo "Gamestate"

# Funzione per eliminare il nodo dalla scena
func die():
	queue_free()  # Rimuove il nodo dalla scena
	pass  # Parola chiave opzionale, non fa nulla ma può essere usata per indicare che il blocco di codice è intenzionalmente vuoto
