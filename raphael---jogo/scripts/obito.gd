extends CharacterBody2D
signal game_over
var gravity: float = 800.0
var flap_strenght: float = -300.0
var esquer: float = -200.0
var direit: float = 200.0

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	if Input.is_action_just_pressed("flap"):
		velocity.y = flap_strenght
		
	if Input.is_action_just_pressed("esquerda"):
		velocity.x = esquer
		
	if Input.is_action_just_pressed("direita"):
		velocity.x = direit
	
	
	
	
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	game_over.emit()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	game_over.emit()
