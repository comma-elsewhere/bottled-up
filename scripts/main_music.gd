extends Node

@onready var loop: AudioStreamPlayer = $MainMusicLoop

func _on_main_music_intro_finished() -> void:
	loop.play()
