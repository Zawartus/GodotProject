class_name HitBox
extends Area2D

@export var damage: int = 5  # Siła ataku

func _init() -> void:
	collision_layer = 4
	collision_mask = 0
	
