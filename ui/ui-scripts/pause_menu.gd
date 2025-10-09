extends Control

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("exit_game"):
		open_close_menu()

func _on_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/levels/main_menu.tscn")
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	GFunc.reset_vars()

func _on_resume_button_pressed() -> void:
	open_close_menu()

func open_close_menu():
	visible = !visible
	get_tree().paused = visible
	if visible:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
