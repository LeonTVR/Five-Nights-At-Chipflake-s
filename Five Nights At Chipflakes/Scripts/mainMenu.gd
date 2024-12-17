# "I can tuck away my johnson but I can never tuck away the shame." - Danny

extends Node2D

var RNG = RandomNumberGenerator.new()

var chipBad = false;

@export var goodChip : Node
@export var badChip : Node
@export var fade : Node
@export var music : AudioStreamPlayer2D
@export var continueButton : Button
@export var starOne : Node
@export var starTwo : Node
@export var starThree : Node
@export var nightSixButton : Node
@export var nightSixButtonSee : Node
@export var customNightButton : Node
@export var customNightButtonSee : Node
@export var creditsButton : Node

var night = 1;
var hardModeBeaten = false;
var nightFiveBeaten = false;
var nightSixBeaten = false;

func loadSave():
	var file_path = "res://saveData.save"
	var saveGame = FileAccess.open(file_path, FileAccess.READ)
	
	if !saveGame:
		saveGame = FileAccess.open(file_path, FileAccess.WRITE)
		saveGame.store_line("1")
		saveGame.store_line("false")
		saveGame.store_line("false")
		saveGame.store_line("false")
		saveGame.close()

		saveGame = FileAccess.open(file_path, FileAccess.READ)
	
	var hardModeBeatenString;
	var nightSixBeatenString;
	var nightFiveBeatenString;
	
	night = saveGame.get_line()
	hardModeBeatenString = saveGame.get_line()
	nightSixBeatenString = saveGame.get_line()
	nightFiveBeatenString = saveGame.get_line()
	
	night = int(night)

	if hardModeBeatenString == "false":
		hardModeBeaten = false
	elif hardModeBeatenString == "true":
		hardModeBeaten = true
	
	if nightSixBeatenString == "false":
		nightSixBeaten = false
	elif nightSixBeatenString == "true":
		nightSixBeaten = true
	
	if nightFiveBeatenString == "false":
		nightFiveBeaten = false
	elif nightFiveBeatenString == "true":
		nightFiveBeaten = true
	
	saveGame.close()

func save():
	var saveGame = FileAccess.open("res://saveData.save", FileAccess.WRITE)
	
	saveGame.store_line(JSON.stringify(night))
	saveGame.store_line(JSON.stringify(hardModeBeaten))
	saveGame.store_line(JSON.stringify(nightSixBeaten))
	saveGame.store_line(JSON.stringify(nightFiveBeaten))
	
	saveGame.flush()
	saveGame.close()

func _ready():
	Engine.max_fps = 60
	
	loadSave()
	
	if night != 1 && night != 2 && night != 3 && night != 4 && night != 5 && night != 6:
		night = 1;
	
	if night == 1:
		continueButton.disabled = true
	
	if nightFiveBeaten:
		starOne.visible = true;
		
		nightSixButton.visible = true;
		nightSixButtonSee.visible = true;
		
		creditsButton.visible = true;
	if nightSixBeaten:
		starTwo.visible = true;
		
		customNightButton.visible = true;
		customNightButtonSee.visible = true;
	if hardModeBeaten:
		starThree.visible = true;

func _process(_delta):
	var randomNumber = RNG.randf_range(0, 75)
	
	randomNumber = round(randomNumber)

	if music.playing == false:
		music.play();
	
	if randomNumber == 35:
		if chipBad == true:
			badChip.visible = false
			goodChip.visible = true
			
			chipBad = false
			
			print("Chip has been reedeemed.")
		elif chipBad == false:
			badChip.visible = true
			goodChip.visible = false
		
			chipBad = true
			
			print("Chip has turned evil.")

func _on_play_button_button_up():
	fade.modulate.a = 0
	
	fade.visible = true
	
	for i in range(0, 100):
		await get_tree().create_timer(0.01).timeout
		
		fade.modulate.a += 0.01
		
		music.volume_db -= 0.50
	
	await get_tree().create_timer(1).timeout
	
	get_tree().change_scene_to_file("res://Scenes/newspaper.tscn")

func _on_exit_button_pressed():
	save()
	
	get_tree().quit()

func _on_continue_button_button_up():
	fade.modulate.a = 0
	
	fade.visible = true
	
	for i in range(0, 100):
		await get_tree().create_timer(0.01).timeout
		
		fade.modulate.a += 0.01
		
		music.volume_db -= 0.50
	
	await get_tree().create_timer(1).timeout
	
	if night != 1:
		if night == 2:
			get_tree().change_scene_to_file("res://Nights/nightTwoEnter.tscn")
		elif night == 3:
			get_tree().change_scene_to_file("res://Nights/nightThreeEnter.tscn")
		elif night == 4:
			get_tree().change_scene_to_file("res://Nights/nightFourEnter.tscn")
			
			print("A");
		elif night ==  5 || night == 6:
			get_tree().change_scene_to_file("res://Nights/nightFiveEnter.tscn")

func _on_night_six_button_button_up():
	fade.modulate.a = 0
	
	fade.visible = true
	
	for i in range(0, 100):
		await get_tree().create_timer(0.01).timeout
		
		fade.modulate.a += 0.01
		
		music.volume_db -= 0.50
	
	await get_tree().create_timer(1).timeout
	
	get_tree().change_scene_to_file("res://Nights/nightSixEnter.tscn");

func _on_custom_night_button_button_up():
	fade.modulate.a = 0
	
	fade.visible = true
	
	for i in range(0, 100):
		await get_tree().create_timer(0.01).timeout
		
		fade.modulate.a += 0.01
		
		music.volume_db -= 0.50
	
	await get_tree().create_timer(1).timeout
	
	get_tree().change_scene_to_file("res://Scenes/customNightSelection.tscn");

func _on_credits_button_button_up():
	fade.modulate.a = 0
	
	fade.visible = true
	
	for i in range(0, 100):
		await get_tree().create_timer(0.01).timeout
		
		fade.modulate.a += 0.01
		
		music.volume_db -= 0.50
	
	await get_tree().create_timer(1).timeout
	
	get_tree().change_scene_to_file("res://Scenes/credits.tscn");
