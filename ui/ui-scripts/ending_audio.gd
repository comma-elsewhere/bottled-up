extends AudioStreamPlayer

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("exit_game"):
		get_tree().quit()

func _on_finished() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/main_menu.tscn")
	GFunc.reset_vars()
