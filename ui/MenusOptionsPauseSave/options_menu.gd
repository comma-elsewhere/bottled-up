extends MarginContainer

@onready var volume_slider: HSlider = %VolumeSlider
@onready var sensitivity_slider: HSlider = %SenseSlider
@onready var mute_box: CheckButton = %MuteBox
@onready var res_options: OptionButton = %ResButton
@onready var fullscreen_box: CheckButton = %FullScreenButton

func _ready() -> void:
	volume_slider.value = AudioServer.get_bus_volume_linear(0)
	sensitivity_slider.value = GVar.sensitivity

func _on_h_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(0, value)
	print(AudioServer.get_bus_volume_linear(0))
	print(value)

func _on_check_box_1_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0, toggled_on)


func _on_option_button_item_selected(index: int) -> void:
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1920,1080))
		1:
			DisplayServer.window_set_size(Vector2i(1600,900))
		2:
			DisplayServer.window_set_size(Vector2i(1280,720))


#func _on_check_button_2_toggled(toggled_on: bool) -> void:
	#if toggled_on:
		#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	#else:
		#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_h_slider_2_value_changed(value: float) -> void:
	GVar.sensitivity = value
