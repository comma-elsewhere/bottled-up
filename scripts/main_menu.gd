extends Control

@onready var settings: MarginContainer = $Settings
@onready var controls: MarginContainer = $Controls

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/main.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_toggle_control_box_pressed() -> void:
	if !settings.visible:
		controls.visible = !controls.visible

func _on_toggle_settings_pressed() -> void:
	if !controls.visible:
		settings.visible = !settings.visible
