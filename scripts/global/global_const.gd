extends Node

var messages: Dictionary = {
	1: "I don't know how I got here but something’s off… I feel like I'm being watched… I hope someone’s looking for me, who knows how long I’ll be out here.", 
	
	2: "Creepy… could those wolves stop staring at me? Fight me you damn beasts!! Don’t just stand there!! Come out and fight!!", 
	3: "Dont look at me, dont look at me, dont look at me- all they do is stare! What do they want?? What did I do to deserve this?!!", 
	4: "The loneliness is calming, quiet, soothing. The never-ending lull off the sea.", 
	5: "I cry, I scream, I call into the void, Will anyone come to my rescue?", 
	6: "Theres this itch, a need to hate, yet a love for this place. A love and hate of the same, Its lonely yet a place of peace...", 
	7: "There’s people here, they simply stare and keep their distance, I’m the muse of this painting, a figure to watch and study", 
	8: "This place of silence and avoidance is nice, I don’t ever wish to leave, no need to worry or stress over little things. This place is my salvation.", 
	9: "Monotnous rise and fall of the sun is all I wait for. Day, Night, Day, Night. Wake, Sleep, Wake, Sleep. That’s all I live for...", 
	
	10: "I don't like thinking of what's on the other side of life. The other face of this coin.. maybe there's new opportunities for me? More than this endless path?"}

var player_words: Dictionary = {
	"awake" = {0: "Where am I?", 1: "I must've fallen overboard...", 2: "An island? But how...", 3: "My head is pounding- I need to find a way back.", 4: "It's dark, I should signal for help."},
	"bottles" = {1: "These bottles seem to be washing up on shore...", 2: "Maybe one of them can help me?", 3: "Maybe I'll find some answers.", 4: "Maybe I'll find what I need..."},
	"wolf" = {1: "Was that a person...?", 2: "My eyes must be playing tricks on me.", 3: "Couldn't be.", 4: "Maybe I'm not alone here..."},
	"crisis" = {1: "Has anyone even noticed I'm missing...?", 2: "They must be looking for me right now.", 3: "I need to find a way out myself.", 4: "Maybe I'm here for a reason..."}
}
var player_choices: Dictionary = {
	"awake" = {1: "Reason", 2: "Observe", 3: "Survival", 4: "Rational"},
	"bottles" = {2: "Hope", 3: "Reason"},
	"wolf" = {2: "Logic", 3: "Bravery"},
	"crisis" = {2: "Hope", 3: "Bravery"}
}
