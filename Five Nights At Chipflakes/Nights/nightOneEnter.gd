extends Node2D

@export var darkness : Node

func fadeIn():
	var tween = create_tween();
	
	tween.tween_property(darkness, "modulate:a", 0, 3).from(1);

func fadeOut():
	var tween = create_tween();
		
	tween.tween_property(darkness, "modulate:a", 1, 3).from(0);

func _ready():
	Engine.max_fps = 60;
	
	fadeIn();

	await get_tree().create_timer(6).timeout;
	
	fadeOut();
	
	await get_tree().create_timer(6).timeout;

	get_tree().change_scene_to_file("res://Nights/nightOne.tscn");
