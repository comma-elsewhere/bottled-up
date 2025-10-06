extends Node

func gameover(drowned):
	GSignal.end_game.emit(drowned)
	reset_vars()

func reset_vars():
	GVar.messages_collected = 0
	GVar.wolf_counter = 0
	GVar.rng_messages = [1]
	rng_redo()

func rng_redo():
	while GVar.rng_messages.size() < GVar.total_messages:
		var ri = randi_range(1, 9)
		if !GVar.rng_messages.has(ri):
			GVar.rng_messages.push_back(ri)
	GVar.rng_messages.push_back(10)
