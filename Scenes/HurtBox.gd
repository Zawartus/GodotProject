class_name HurtBox
extends Area2D

func _init() -> void:
	collision_layer = 0
	collision_mask = 4

func _ready() -> void:
	connect("area_entered", self._on_area_entered)

func _on_area_entered(hitbox: HitBox) -> void:
	if hitbox == null:
		return
	
	if owner.has_method("take_damage"):
		owner.take_damage(hitbox.damage)  # Zmniejsz HP właściciela

		# Jeśli obiekt ma pasek życia, aktualizujemy go
		if owner.has_node("HealthBar"):
			var health_bar = owner.get_node("HealthBar")
			health_bar._set_health(owner.health)
