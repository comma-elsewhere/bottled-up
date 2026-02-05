extends Control

@export_group("UI Elements")
@export_subgroup("Containers")
@export var main_panel: VBoxContainer
@export var saved_panel: VBoxContainer
@export var options_panel: VBoxContainer
@export var controls_panel: VBoxContainer
@export_subgroup("Buttons")
@export var saved_button: Button
@export var options_button: Button
@export var controls_button: Button

var current_panel: VBoxContainer
	
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	#if GVar.game_started:
		#saved_button.disabled = false
	#else:
		#saved_button.disabled = true
	
	saved_button.button_up.connect(_toggle_panel.bind(saved_panel))
	options_button.button_up.connect(_toggle_panel.bind(options_panel))
	controls_button.button_up.connect(_toggle_panel.bind(controls_panel))
	
	current_panel = main_panel
	_show_panel()
	
func _toggle_panel(panel: VBoxContainer) -> void:
	if current_panel:
		current_panel.hide()
		
	current_panel = panel
	_show_panel()
	
func _show_panel() -> void:
	current_panel.show()

func _on_back_button_button_up() -> void:
	_toggle_panel(main_panel)
