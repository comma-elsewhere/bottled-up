extends Node

#For settings menu
var sensitivity: float = 0.01 #this should clamp between 0.005 and 0.03 for a slider
var headbob: bool = true #on/off toggle
var vhs_overlay: bool = true #on/off toggle

#vars that need to be saved
var total_messages: int = 6
var rng_messages: Array[int] = [1]
var messages_collected: int = 0
var wolf_counter: int = 0
var game_started: bool = false
