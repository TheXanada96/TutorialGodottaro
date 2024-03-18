extends Control

func _ready(): 
	var prompts = ["Pietro", "Smusi", "lezzo", "unto"]
	var story = "Una volta un certo %s %s un obamista %s mi ha chiamato %s perché ero albanese"
	var albanian = story % prompts


	$VBoxContainer/DisplayText.text = albanian


func _on_LineEdit_text_entered(new_text):
	update_DisplayText(new_text)


func update_DisplayText(words):
	$VBoxContainer/DisplayText.text = words
	$VBoxContainer/LineEdit.clear() 
	
