extends KinematicBody2D  # Estende la classe KinematicBody2D, quindi questo script è attaccato a un nodo KinematicBody2D

var motion = Vector2(0,0)  # Variabile per memorizzare il movimento del personaggio
var Obama = 2  # Variabile non utilizzata nel codice corrente

const SPEED = 700  # Velocità di movimento del personaggio
const GRAVITY = 50  # Forza di gravità applicata al personaggio
const UP = Vector2(0,-1)  # Direzione verso l'alto
const JUMP_SPEED = 2000  # Velocità di salto del personaggio
const WORLD_LIMIT = 4000  # Limite del mondo in altezza
const BOOST_MULTIPLIER = 2  # Moltiplicatore per il boost del salto

#signal animazione  # Segnale per l'animazione (commentato nel codice originale)

# Funzione chiamata ad ogni frame fisico
func _physics_process(delta):
	apply_gravity()  # Applica la gravità al personaggio
	jump()  # Gestisce il salto del personaggio
	move()  # Gestisce il movimento orizzontale del personaggio
	animate()  # Emette il segnale di animazione
	move_and_slide(motion, UP)  # Muove il personaggio e gestisce le collisioni

# Funzione chiamata ad ogni frame
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("cambio_scena"):  # Controlla se l'azione "cambio_scena" è stata appena premuta
		get_tree().change_scene("res://Avventura Testuale/Il MHANZ Definito.tscn")  # Cambia la scena

# Funzione per applicare la gravità
func apply_gravity():
	if position.y > WORLD_LIMIT:  # Se il personaggio supera il limite del mondo
		get_tree().call_group("Gamestate", "end_game")  # Chiama la funzione "end_game" nel gruppo "Gamestate"
	if is_on_floor() and motion.y > 0:  # Se il personaggio è a terra e si sta muovendo verso il basso
		motion.y = 0  # Ferma il movimento verticale
	elif is_on_ceiling():  # Se il personaggio è sul soffitto
		motion.y = 1  # Inizia a muoversi verso il basso
	else:
		motion.y += GRAVITY  # Applica la gravità al movimento verticale

# Funzione per gestire il salto
func jump():
	if Input.is_action_pressed("Jump") and is_on_floor():  # Se il tasto di salto è premuto e il personaggio è a terra
		motion.y = -JUMP_SPEED  # Imposta la velocità di salto
		$JumpSFX.play()  # Riproduce l'effetto sonoro del salto

# Funzione per gestire il movimento orizzontale
func move():
	if Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):  # Se il tasto sinistro è premuto e il destro no
		motion.x = -SPEED  # Muove il personaggio a sinistra
	elif Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):  # Se il tasto destro è premuto e il sinistro no
		motion.x = SPEED  # Muove il personaggio a destra
	else:
		motion.x = 0  # Ferma il movimento orizzontale

# Funzione per gestire l'animazione
func animate():
	emit_signal("animazione", motion)  # Emette il segnale di animazione con il movimento attuale

# Funzione per gestire il danno al personaggio
func hurt():
	motion.y -= 1  # Riduce leggermente il movimento verticale
	yield(get_tree(), "idle_frame")  # Attende un frame
	motion.y -= JUMP_SPEED  # Applica una velocità di salto negativa
	#lives -= 1  # Riduce il numero di vite (commentato nel codice originale)
	$PainSFX.play()  # Riproduce l'effetto sonoro del dolore
	#if lives < 0:  # Se le vite sono minori di 0 (commentato nel codice originale)
	#    end_game()  # Termina il gioco (commentato nel codice originale)

# Funzione per gestire il boost del salto
func boost():
	motion.y -= 1  # Riduce leggermente il movimento verticale
	yield(get_tree(), "idle_frame")  # Attende un frame
	motion.y -= JUMP_SPEED * BOOST_MULTIPLIER  # Applica una velocità di salto negativa moltiplicata per il boost
	
	#if motion.y < 0:  # Se il movimento verticale è negativo (commentato nel codice originale)
	#    $PlayerObamico.play("jump")  # Riproduce l'animazione di salto (commentato nel codice originale)
	#elif motion.x >= 0:  # Se il movimento orizzontale è positivo (commentato nel codice originale)
	#    $PlayerObamico.play("walk")  # Riproduce l'animazione di camminata (commentato nel codice originale)
	#    $PlayerObamico.flip_h = false  # Imposta la direzione dell'animazione (commentato nel codice originale)
	#elif motion.x <= 0:  # Se il movimento orizzontale è negativo (commentato nel codice originale)
	#    $PlayerObamico.play("walk")  # Riproduce l'animazione di camminata (commentato nel codice originale)
	#    $PlayerObamico.flip_h = true  # Imposta la direzione dell'animazione (commentato nel codice originale)
	#else:
	#    $PlayerObamico.play("idle")  # Riproduce l'animazione di inattività (commentato nel codice originale)
