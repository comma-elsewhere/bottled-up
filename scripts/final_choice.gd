extends VBoxContainer

signal player_choice

@export var true_end_button: Button
@export_group("Endings")
@export var escape_end: PackedScene
@export var give_up_end: PackedScene
@export var true_end: PackedScene

func _ready() -> void:
	true_end_button.hide()

func enable_true_end() -> void:
	true_end_button.show()

func _on_escape_button_button_up() -> void:
	#await _wait_for_it()
	get_tree().change_scene_to_packed(escape_end)


func _on_give_up_button_button_up() -> void:
	#await _wait_for_it()
	get_tree().change_scene_to_packed(give_up_end)


func _on_true_end_button_button_up() -> void:
	#await _wait_for_it()
	get_tree().change_scene_to_packed(true_end)


func _wait_for_it() -> bool:
	player_choice.emit()
	await get_tree().create_timer(1.1).timeout
	return true
