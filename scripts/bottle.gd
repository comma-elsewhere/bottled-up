extends ItemClass

@onready var bottle_clink: AudioStreamPlayer3D = $BottleClink
@onready var paper_unroll: AudioStreamPlayer3D = $PaperUnroll
	
func play_paper_audio():
	paper_unroll.play(0.64)

func play_bottle_clink():
	bottle_clink.play(0.76)
