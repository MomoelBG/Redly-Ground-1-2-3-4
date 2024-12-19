extends Node3D

@onready var gate1 = $Puzzles/Gate25

func _on_button_5_pressed():
	gate1._open()
