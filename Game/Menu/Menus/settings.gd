extends Control

var open = false

@onready var setting: Control = $setting
@onready var animation_player = $AnimationPlayer

func _ready():
	visible = false

func _toggle_menu() -> void:
	if open:
		_close_settings()
	else:
		_open_settings()

func _open_settings():
	visible = true
	_unload_sections()
	animation_player.play("open")
	open = true

func _close_settings():
	_unload_sections()
	animation_player.play("close")
	open = false

func _load_section(section: String):
	_unload_sections()
	setting.visible = true
	var string_setting = str("setting/", section)
	var node_setting = get_node(string_setting)
	node_setting.visible = true

func _unload_sections():
	setting.visible = false
	var row = 2
	while not setting.get_child(row) == null:
		var child = setting.get_child(row)
		child.visible = false
		row += 1

func _on_button_pressed():
	_close_settings()

#CONNECTED BUTTON SIGNALS

func _on_audio_pressed() -> void:
	_load_section("audio")

func _on_display_pressed() -> void:
	_load_section("display")

func _on_graphics_pressed() -> void:
	_load_section("graphics")

func _on_controls_pressed() -> void:
	_load_section("controls")

func _on_language_pressed() -> void:
	_load_section("language")

#CLOSE SIGNAL

func _on_back_pressed() -> void:
	_close_settings()

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "close":
		visible = false

func _on_volume_value_changed(value):
	AudioServer.set_bus_volume_db(0,value)

func _on_check_box_toggled(toggled_on):
	AudioServer.set_bus_mute(0,toggled_on)

func _on_resolution_item_selected(index):
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1152,648))
		1:
			DisplayServer.window_set_size(Vector2i(2060,1080))
		2:
			DisplayServer.window_set_size(Vector2i(800,500))
