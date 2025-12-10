extends Node

@export var load_bottle: PackedScene

func _ready() -> void:
	var bottle_num := 9
	var bottle_pos: Array = get_children()
	
	while bottle_num > 0:
		var index = bottle_pos.find(bottle_pos.pick_random())
		var new_pos: Marker3D = bottle_pos.pop_at(index) as Marker3D
		var new_bottle = load_bottle.instantiate()
		add_child(new_bottle)
		new_bottle.global_position = new_pos.global_position
		bottle_num -= 1
