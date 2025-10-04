extends Node

@onready var start_button = $MarginContainer/VBoxContainer/startButton
@onready var settings_button = $MarginContainer/VBoxContainer/settingButton
@onready var quit_button = $MarginContainer/VBoxContainer/quitButton
@onready var close_settings_button = $MarginContainer2/MarginContainer/closeSettingsButton
@onready var settings_window = $MarginContainer2

func _ready():
	start_button.pressed.connect(_on_start_pressed)
	settings_button.pressed.connect(_on_settings_pressed)
	quit_button.pressed.connect(_on_quit_pressed)
	close_settings_button.pressed.connect(_on_settings_closed)
	

func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/main.tscn")

func _on_settings_pressed():
	settings_window.visible = true

func _on_quit_pressed():
	get_tree().quit()
	
func _on_settings_closed():
	settings_window.visible = false
