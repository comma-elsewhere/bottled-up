extends Node
@export var world_root: Node3D
@export var player: CharacterBody3D

func save_game() -> void:
	var saved_game: SavedGame = SavedGame.new()
	
	world_root.call_group("GameEvent", "on_save_game", saved_game.saved_data)
	
	saved_game.player_pos = player.global_position
	
	saved_game.set_rng = GVar.rng_messages
	saved_game.collect_messages = GVar.messages_collected
	saved_game.found_wolves = GVar.wolf_counter
	
	ResourceSaver.save(saved_game, "user://savedata.res")
	
func load_game() -> void:
	var saved_game = load("user://savedata.res")
	
	world_root.call_group("GameEvent","on_preload")
	
	GFunc.on_save_load(saved_game.set_rng, saved_game.collect_messages, saved_game.found_wolves)
	
	for item in saved_game.saved_data:
		var load_item = load(item.scene_file_path) as PackedScene
		var instantiate_item = load_item.instantiate()
		world_root.add_child(instantiate_item)
		instantiate_item.on_load(item)
