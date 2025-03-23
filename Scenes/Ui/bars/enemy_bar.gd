extends ProgressBar

@onready var timer = $Timer
@onready var damage_bar = $DamageBar

var health = 0 : set = _set_health

func _set_health(new_health):
	var prev_health = health
	health = clamp(new_health, 0, max_value)  # Zapewnia, że HP nie spadnie poniżej 0
	value = health  # Aktualizacja głównego paska HP

	if health <= 0:
		queue_free()  # Usuwa obiekt, jeśli HP spadnie do 0

	if health < prev_health:
		timer.start()  # Rozpoczyna animację "damage"
	else:
		damage_bar.value = health  # Natychmiastowa aktualizacja paska obrażeń

func init_health(_health):
	health = _health
	max_value = health
	value = health
	damage_bar.max_value = health
	damage_bar.value = health

func _on_timer_timeout() -> void:
	damage_bar.value = health  # Aktualizacja paska po czasie
