extends ItemClass

@onready var paper_unroll: AudioStreamPlayer3D = $PaperUnroll

func _ready() -> void:
	GSignal.message_opened.connect(play_paper_audio)
	
func play_paper_audio(_arg):
	paper_unroll.play(0.3)
