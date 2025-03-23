extends Node2D

@onready var animation_player := $AnimatedSprite2D
@onready var health_bar := $HealthBar  # Pobieramy HealthBar

var health: int = 100  # Początkowe HP

func take_damage(amount: int) -> void:
	health -= amount  # Odejmujemy HP
	animation_player.play("Hit")  # Odtwarzamy animację trafienia
	print("Damage: ", amount)

	# Aktualizujemy pasek zdrowia
	if health_bar:
		health_bar._set_health(health)

	# Jeśli HP spadnie do 0, usuń przeciwnika
	if health <= 0:
		queue_free()
