extends RigidBody3D
class_name ItemClass

#everything here is for pickup and drop
@export var bottle_sound: AudioStreamPlayer3D
@onready var player = get_tree().get_first_node_in_group("Player")
@onready var item_hand = get_tree().get_first_node_in_group("ItemPickup")
var selected: bool = false

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact") and selected:
		player.pickup_item(self)
		bottle_sound.play(0.8)

func _physics_process(_delta: float) -> void:
	if item_hand == get_parent():
		freeze = true
#	else:
#		freeze = false

func set_selected(item):
	if item == self:
		selected = true
	else:
		selected = false

func self_clear(item):
	if item == self:
		await get_tree().create_timer(0.1).timeout
		call_deferred("queue_free")
