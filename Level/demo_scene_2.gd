extends Node3D

@onready var gate1 = $Puzzles/Gate25
@onready var gate2
@onready var ppc4_1



func _on_button_5_pressed():
	gate1._open()

func _on_power_reciever_power_recieved():
	pass
