extends Area3D

@onready var player = get_tree().get_first_node_in_group("Player")

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		player.gameover()
