extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer  # Dodaj AnimationPlaye
@onready var health_bar: ProgressBar = $HealthBar
@onready var scene_a = $"../kilzone"  # Odwołanie do ScenaA

const SPEED = 120.0
const JUMP_VELOCITY = -300.0

var attacking = false  # Dodaj zmienną ataku

func attack():
	if attacking:
		return  # Jeśli już atakujemy, nie pozwalamy na ponowne wykonanie

	attacking = true
	animated_sprite_2d.play("attack_slash")
	animation_player.play("slash")

	# Podłączamy sygnał do funkcji, ale nie blokujemy działania kodu
	animated_sprite_2d.animation_finished.connect(_on_attack_finished, CONNECT_ONE_SHOT)

func _on_attack_finished():
	attacking = false  # Teraz postać może znowu się poruszać


func _physics_process(delta: float) -> void:
	# Zablokowanie ruchu, jeśli postać atakuje
	if attacking:
		velocity.x = 0
		return
	
	# Dodanie grawitacji
	if not is_on_floor():
		velocity.y += 980 * delta  # Standardowa grawitacja

	# Skakanie
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Pobranie kierunku ruchu (-1, 0, 1)
	var direction := Input.get_axis("move_left", "move_right")

	# Obracanie postaci
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	
	# Animacje
	if is_on_floor():
		if direction == 0:
			if Input.is_action_just_pressed("attack"):
				attack()
			else:
				animated_sprite_2d.play("Idle")
		else:
			animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("jumping")
		
	# Ruch postaci
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
