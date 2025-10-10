extends Node

@onready var player: AudioStreamPlayer = $MainMusicLoop

var intro_length: float = 32.678
var total_length: float = 102.491

func _process(_delta: float) -> void:
	if player.get_playback_position() >= total_length:
		var play_from = intro_length - total_length + player.get_playback_position()
		player.play(play_from)
