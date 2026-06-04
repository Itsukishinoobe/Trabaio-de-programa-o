extends Camera2D

@onready var personagem: Node2D = $"../prota"


var distancia_frente: float = 537.0 

func _process(_delta: float) -> void:
	if personagem:
		
		global_position.x = personagem.global_position.x + distancia_frente
