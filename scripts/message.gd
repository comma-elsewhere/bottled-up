extends Control

@onready var message: Label = $MarginContainer/TextureRect/MarginContainer/Message


func _ready() -> void:
	GSignal.message_opened.connect(set_text)
	
func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact") and self.visible:
		self.visible = false
		message.text = ""
	
func set_text(message_id):
	message.text = GConst.messages[message_id]
	self.visible = true
