extends Node2D

@onready var animation_player := $AnimatedSprite2D

func take_damage(amount: int) -> void:
	animation_player.play("Hit")
	print("Damage: ", amount)
