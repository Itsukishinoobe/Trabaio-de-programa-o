extends Area2D


@export var velocidade: float = 140.0


var prota: CharacterBody2D = null

func _ready() -> void:


	prota = get_tree().current_scene.get_node_or_null("prota")
	
	
	body_entered.connect(_on_body_entered)

func _physics_process(delta: float) -> void:
	if prota != null:
	
		
		var alvo_x = prota.position.x - 300 # Fica sempre um pouco atrás do prota
		
		
		position.x = move_toward(position.x, prota.position.x, velocidade * delta)
		position.y = move_toward(position.y, prota.position.y, velocidade * delta)

func _on_body_entered(body: Node2D) -> void:
	
	if body.name == "prota":
		print("Game Over!")
		
		get_tree().change_scene_to_file("res://scenes/GameOver.tscn")
		
	
	elif body.is_in_group("inimigos"):
		body.queue_free()
