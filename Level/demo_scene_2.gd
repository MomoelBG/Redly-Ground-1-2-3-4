extends Node3D

@onready var gate1 = $Puzzles/Gate25
@onready var gate2
@onready var ws1
@onready var ps1 = $power_source

func _on_button_5_pressed():
	gate1._open()

func _on_power_reciever_power_recieved():
	pass 

func _on_green_reciever_power_recieved():
	ps1.can_power = true
