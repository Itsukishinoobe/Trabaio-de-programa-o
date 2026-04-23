extends CanvasLayer
var pontos: int = 0


func _on_timer_timeout() -> void:
	pontos += 1 
	$Label.text = "Pontuação" + str(pontos)
