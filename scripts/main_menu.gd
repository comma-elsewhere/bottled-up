extends Control

@onready var settings_window = $Settings

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/main.tscn")

func _on_setting_button_pressed() -> void:
	settings_window.visible = true

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_close_settings_button_pressed() -> void:
	settings_window.visible = false
