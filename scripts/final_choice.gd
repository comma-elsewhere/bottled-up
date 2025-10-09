extends Control

@onready var true_button: Button = $VBoxContainer/ButtonContainer/TrueButton


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and GVar.messages_collected >= 7:
		
		visible = true
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _on_true_button_pressed() -> void:
	get_tree().change_scene_to_file("res://ui/ui-scenes/vague_end.tscn")

func _on_bad_button_pressed() -> void:
	get_tree().change_scene_to_file("res://ui/ui-scenes/bad_end.tscn")
