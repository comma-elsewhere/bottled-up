extends Node

func _ready() -> void:
	while GVar.rng_messages.size() < GVar.total_messages:
		var ri = randi_range(1, 9)
		if !GVar.rng_messages.has(ri):
			GVar.rng_messages.push_back(ri)
	GVar.rng_messages.push_back(10)
	print(GVar.rng_messages)
