extends Area3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var player = get_tree().get_first_node_in_group("Player")
var offset_angle: float = -110.0

func _physics_process(_delta: float) -> void:
	if player != null:
		rotate_self()

func rotate_self():
#some trig to find the theta angle with tangent between wolf and player
	var dis_z = player.global_transform.origin.z - global_transform.origin.z
	var dis_x = player.global_transform.origin.x - global_transform.origin.x
	var theta = atan2(dis_z, dis_x)
	rotation.y = -theta + deg_to_rad(offset_angle)


func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("Eyes"):
		GVar.wolf_counter += 1
		await get_tree().create_timer(1.0).timeout
		animation_player.play("fade_away")
		await animation_player.animation_finished
		call_deferred("queue_free")
