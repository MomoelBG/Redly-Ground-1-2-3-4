extends AnimationPlayer

func _ready():
	play("start")

func _on_button_3_pressed():
	play("ascenseur_anim")
