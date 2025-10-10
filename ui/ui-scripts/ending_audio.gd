extends AudioStreamPlayer

func _ready() -> void:
	GFunc.reset_vars()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("exit_game"):
		get_tree().change_scene_to_file("res://scenes/levels/main_menu.tscn")

func _on_finished() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/main_menu.tscn")
