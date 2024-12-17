extends Node2D

@export var darkness : Node

var night;

var hardModeBeaten;
var nightFiveBeaten;
var nightSixBeaten;

var hardModeBeatenString;
var nightSixBeatenString;
var nightFiveBeatenString;

var A;

func save():
	var saveGame = FileAccess.open("res://saveData.save", FileAccess.WRITE);
	var saveGame2 = FileAccess.open("res://saveData.save", FileAccess.READ);
	
	A = saveGame.get_line();
	hardModeBeatenString = saveGame.get_line();
	nightSixBeatenString = saveGame.get_line();
	nightFiveBeatenString = saveGame.get_line();
	
	if 3 > int(night):
		night = 3;
		
		saveGame.store_line(JSON.stringify(night));
		
		saveGame.store_line(JSON.stringify(hardModeBeaten))
		saveGame.store_line(JSON.stringify(nightSixBeaten))
		saveGame.store_line(JSON.stringify(nightFiveBeaten))
	
	saveGame.flush();
	saveGame.close();

func loadSave():
	var file_path = "res://saveData.save";
	var saveGame = FileAccess.open(file_path, FileAccess.READ);

	night = saveGame.get_line();
	
	hardModeBeaten = saveGame.get_line();
	nightSixBeaten = saveGame.get_line();
	nightFiveBeaten = saveGame.get_line();
	
	saveGame.close();

func fadeIn():
	var tween = create_tween();
	
	tween.tween_property(darkness, "modulate:a", 0, 3).from(1);

func fadeOut():
	var tween = create_tween();
		
	tween.tween_property(darkness, "modulate:a", 1, 3).from(0);

func _ready():
	Engine.max_fps = 60;
	
	loadSave();
	save();
	
	fadeIn();

	await get_tree().create_timer(6).timeout;
	
	fadeOut();
	
	await get_tree().create_timer(6).timeout;

	get_tree().change_scene_to_file("res://Nights/nightThree.tscn");
