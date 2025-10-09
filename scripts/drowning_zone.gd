extends Area3D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		timer.start()

func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		timer.stop()

func _on_timer_timeout() -> void:
	GFunc.gameover(true)
