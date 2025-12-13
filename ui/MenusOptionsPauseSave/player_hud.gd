extends SubViewportContainer

const MAIN := "res://scenes/levels/main_menu.tscn"

@export var drowned_end: PackedScene
@export var drown_sound: AudioStreamPlayer3D

@onready var message_pop_up: Control = $SubViewport/HUD/MessagePopUp
@onready var pause_menu: PanelContainer = $SubViewport/HUD/PauseMenu
@onready var animation_player: AnimationPlayer = $SubViewport/HUD/AnimationPlayer
@onready var final_choice_box: VBoxContainer = $SubViewport/HUD/FinalChoiceBox


func _ready() -> void:
	animation_player.play_backwards("fadeout")
	final_choice_box.player_choice.connect(_on_player_choice)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("exit_game"):
		if pause_menu.visible == true:
			pause_menu.close()
		else:
			pause_menu.open()

func drown_ending() -> void:
	animation_player.play("death")

func toggle_text(message_id: int) -> void:
	if message_pop_up.visible == false and message_id != 0:
		message_pop_up.set_text(message_id)
	else:
		message_pop_up.clear_text()
		if GVar.messages_collected >= 7:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			final_choice_box.show()

func _player_drowned() -> void:
	drown_sound.play(0.36)
	await drown_sound.finished
	GFunc.gameover()
	get_tree().change_scene_to_packed(drowned_end)

func _on_player_choice() -> void:
	animation_player.play("fadeout")

func _on_pause_menu_quit_game() -> void:
	GFunc.reset_vars()
	get_tree().change_scene_to_file(MAIN)
