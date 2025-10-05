extends Node

#For settings menu
var sensitivity: float = 0.01 #this should clamp between 0.005 and 0.03 for a slider
var headbob: bool = true #on/off toggle
var vhs_overlay: bool = true #on/off toggle
var graphics: bool = true #this is to toggle Voxel GI on/off for the low and high graphics settings

#For RNG bottled messages
var total_messages: int = 6
var rng_messages: Array[int] = [1]
var messages_collected: int = 0
