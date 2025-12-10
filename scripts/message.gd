extends Control

@onready var message: Label = $MarginContainer/TextureRect/MarginContainer/Message

func clear_text() -> void:
	self.visible = false
	message.text = ""
	
func set_text(message_id) -> void:
	message.text = GConst.messages[message_id]
	self.visible = true
