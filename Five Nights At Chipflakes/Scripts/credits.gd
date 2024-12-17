extends Node2D

@export var fade : Node

func _ready():
	for i in range(0, 100):
		await get_tree().create_timer(0.01).timeout
		
		fade.modulate.a -= 0.01
	
	await get_tree().create_timer(1).timeout

func _on_exit_button_up():
	for i in range(0, 100):
		await get_tree().create_timer(0.01).timeout
		
		fade.modulate.a += 0.01
	
	await get_tree().create_timer(1).timeout
	
	get_tree().change_scene_to_file("res://Scenes/mainMenu.tscn");
