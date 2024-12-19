@tool
extends StaticBody3D

@onready var anim = $AnimationPlayer
@onready var opening = $opening
@onready var close = $close

@export var open_by_defualt = false

signal opened
signal closed

var open = false

func _ready():
	if open_by_defualt:
		open = true

func _open():
	opening.play()
	anim.play("open")
	open = true

func _close():
	close.play()
	anim.play("close")
	open = false

func _toggle():
	if open:
		_close()
	else:
		_open()

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "open":
		emit_signal("opened")
	if anim_name == "close":
		emit_signal("closed")
