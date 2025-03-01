extends Control


func _on_toggle_music_toggled(toggled_on: bool) -> void:
	pass # Replace with function body.


func _on_toggle_sfx_toggled(toggled_on: bool) -> void:
	pass # Replace with function body.

func _ready() -> void:
	$VBoxContainer/toggleMusic.grab_focus()


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")
