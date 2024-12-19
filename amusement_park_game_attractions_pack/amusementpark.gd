extends Node3D

@onready var anim = $Sketchfab_model/test/RootNode/AnimationPlayer

func _ready():
	anim.play("swings")
	anim.play("skydrop")
