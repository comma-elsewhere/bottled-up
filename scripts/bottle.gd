extends ItemClass

var message_id: int

func _input(_event: InputEvent) -> void:
	super(_event)
	if Input.is_action_just_pressed("interact") and selected:
		message_id = GVar.rng_messages.pop_front()

func self_clear(item):
	super(item)
	GSignal.message_opened.emit(message_id)
