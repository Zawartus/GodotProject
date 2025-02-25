extends Area2D 

@onready var timer: Timer = $Timer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

  # Wysłanie sygnału
func _on_body_entered(body):
	print("Died")
	Engine.time_scale = 0.5
	timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
