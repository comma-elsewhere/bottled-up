extends PanelContainer

@export var nav_to_game: PackedScene

func _on_start_button_button_up() -> void:
	get_tree().change_scene_to_packed(nav_to_game)


func _on_quit_button_button_up() -> void:
	pass # Replace with function body.


func _on_confirm_continue_button_up() -> void:
	pass # Replace with function body.
