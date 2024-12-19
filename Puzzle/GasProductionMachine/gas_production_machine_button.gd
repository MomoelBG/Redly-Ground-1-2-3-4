extends Node3D

@onready var markL = $markL
@onready var markR = $markR
@onready var anim = $AnimationPlayer
@onready var press = $press

var selectedL = false
var selectedR = false
var sel = false

signal pressed

func _process(delta):
	if selectedL:
		get_tree().call_group("player", "_update_l_position", markL.global_position, markL.global_rotation)
		if not Player.l_launched:
			selectedL = false
	if selectedR:
		get_tree().call_group("player", "_update_r_position", markR.global_position, markR.global_rotation)
		if not Player.r_launched:
			selectedR = false

func _input(event):
	if Input.is_action_just_pressed("use"):
		if sel:
			anim.play("press")
			press.play()
			emit_signal("pressed")
