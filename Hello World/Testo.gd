extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Italiano_button_down():
	TranslationServer.set_locale("it")
	pass # Replace with function body.


func _on_Esperanto_button_down():
	TranslationServer.set_locale("eo")
	pass # Replace with function body.


func _on_Spagnolo_button_down():
	TranslationServer.set_locale("es")
	pass # Replace with function body.


func _on_Russo_button_down():
	TranslationServer.set_locale("ru")
	pass # Replace with function body.


func _on_Interlinguo_button_down():
	TranslationServer.set_locale("ia_FR")
	pass # Replace with function body.


func _on_Inglese_button_down():
	TranslationServer.set_locale("en")
	pass # Replace with function body.


func _on_Giapponese_button_down():
	TranslationServer.set_locale("ja")
	pass # Replace with function body.


func _on_Arabo_button_down():
	TranslationServer.set_locale("ar")
	pass # Replace with function body.


func _on_Etiope_button_down():
	TranslationServer.set_locale("am_ET")
	pass 

func _on_Greco_button_down():
	TranslationServer.set_locale("el_GR")
	pass # Replace with function body.

