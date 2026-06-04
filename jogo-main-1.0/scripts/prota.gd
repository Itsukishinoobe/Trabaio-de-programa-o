extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var is_attacking: bool = false
var is_dead: bool = false

func _physics_process(delta: float) -> void:
	if is_dead:
		return

	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("attack") and not is_attacking:
		trigger_attack()
		
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Define a velocidade horizontal constante para a direita
	velocity.x = SPEED

	move_and_slide()
	update_animations()

func update_animations() -> void:
	if is_attacking:
		return

	if not is_on_floor():
		animated_sprite.play("Jump")
	else:
		animated_sprite.play("Run")

func trigger_attack() -> void:
	is_attacking = true
	
	var variant_attack = randi_range(1, 3)
	
	if variant_attack == 1:
		animated_sprite.play("Attack")
	elif variant_attack == 2:
		animated_sprite.play("Attack2")
	else:
		animated_sprite.play("Attack3")

func trigger_death() -> void:
	is_dead = true
	velocity = Vector2.ZERO
	animated_sprite.play("Death")

func _on_animated_sprite_2d_animation_finished() -> void:
	var attack_animations = ["Attack", "Attack2", "Attack3"]
	
	if animated_sprite.animation in attack_animations:
		is_attacking = false
