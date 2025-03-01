extends Control

func _ready() -> void:
	$VBoxContainer/startButton.grab_focus()  # Allows keyboard select


func _on_start_button_pressed() -> void:
	pass # Replace with function body.



func _on_settings_button_pressed() -> void:
	get_tree().change_scene_to_file("res://settings.tscn") # Opens settings 
	


func _on_quit_button_pressed() -> void:
	get_tree().quit()
	
