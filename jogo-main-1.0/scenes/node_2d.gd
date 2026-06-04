extends Node2D

@export var cena_morcego: PackedScene 
@export var cena_cavalo: PackedScene   
@onready var prota = $prota

func on_spawn_timer_timeout() -> void:
	var lista_monstros = [cena_morcego, cena_cavalo]
	var monstro_sorteado = lista_monstros.pick_random()
	
	if monstro_sorteado:
		var novo_monstro = monstro_sorteado.instantiate()
		novo_monstro.add_to_group("inimigos")
		
   
		var spawn_x = prota.position.x + 800
		var spawn_y = 450 
	   
		if monstro_sorteado == cena_morcego:
			spawn_y = 250
			
		novo_monstro.position = Vector2(spawn_x, spawn_y)
		add_child(novo_monstro)
