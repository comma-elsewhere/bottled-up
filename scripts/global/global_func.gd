extends Node

func gameover(drowned):
	GSignal.end_game.emit(drowned)
