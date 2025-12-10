extends Node

func gameover():
	reset_vars()

func reset_vars():
	GVar.messages_collected = 0
	GVar.wolf_counter = 0
	GVar.rng_messages = [1]
	rng_redo()

func rng_redo():
	while GVar.rng_messages.size() < GVar.total_messages:
		var ri = randi_range(1, 19)
		if !GVar.rng_messages.has(ri):
			GVar.rng_messages.push_back(ri)
	GVar.rng_messages.push_back(20)

func on_save_load(set_rng: Array[int], collect_messsages: int, found_wolves: int):
	GVar.rng_messages = set_rng
	GVar.messages_collected = collect_messsages
	GVar.wolf_counter = found_wolves
	GVar.game_started = true
