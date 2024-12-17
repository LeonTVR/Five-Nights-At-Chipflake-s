extends Node2D

# To be clear, it didn't let me name it static so there was only one option. I deeply apologize. Not really.

@export var darkness : Node
@export var office : Node
@export var penis : VideoStreamPlayer
@export var border : Node
@export var timeLabel : Label
@export var cameraLayout : Node
@export var cameraView : Sprite2D
@export var cameraButtons : Node
@export var penisTwo : Node
@export var chipJumpscareSound : AudioStreamPlayer2D
@export var jumpscareChip : Node
@export var cameraTextNode : Node
@export var message : AudioStreamPlayer2D
@export var messageMuted : AudioStreamPlayer2D
@export var muteMessage : Node
@export var cerealStation : Node
@export var cerealButton : Node
@export var cameraButton : Node
@export var cereal : Node
@export var milk : Node
@export var bowlEmpty : Node
@export var bowlCereal : Node
@export var bowlCum : Node
@export var bowlBoth : Node
@export var cerealPour : Node
@export var milkPour : Node
@export var milkCrime : AudioStreamPlayer2D
@export var clickMe : Node
@export var cerealTimerLabel : Label
@export var bowlTimer : Node
@export var cerealTimer2 : Timer
@export var soggyCereal : Node
@export var placeCereal : Node
@export var cerealEatenNormal : AudioStreamPlayer2D
@export var cerealEatenSoggy : AudioStreamPlayer2D
@export var yay : AudioStreamPlayer2D
@export var winText : Node
@export var cameraFlip : AudioStreamPlayer2D
@export var characterMove : AudioStreamPlayer2D
@export var gunShot : AudioStreamPlayer2D
@export var shootGlock : Node
@export var socksShot : AudioStreamPlayer2D
@export var chipShot : AudioStreamPlayer2D
@export var heaterCheckOff : Node
@export var heaterCheckOn : Node
@export var heaterText : Node
@export var heaterButton : Node
@export var heaterPowerText : Label
@export var skunkVentCrawl : AudioStreamPlayer2D
@export var mess : Node
@export var jumpscareSocks : Node
@export var socksJumpscareSound : AudioStreamPlayer2D
@export var cerealAmountLabel : Label
@export var cerealEatenSprite : Node

var officeX = 960;
var mouseX;
var mouseY;

var cameraUp = false;

var fadedIn = false;

var mouseOnCameraButton = false;

var canFlipCamera = true;

var time = 0;

var chipRandom;
var socksRandom;
var skunkRandom;
var androRandom;

var chipLevel = 0;
var socksLevel = 0;
var skunkLevel = 0;
var androLevel = 0;

var chipCamera = 1;
var socksCamera = 1;

var chipGodMode = false;
var socksGodMode = false;
var skunkGodMode = false;
var androGodMode = false;

var chipLazy = false;
var socksLazy = false;
var skunkLazy = false;
var androLazy = false;

var inJumpscare = false;

var makingCereal = false;

var canMakeCereal = true;

var cerealDragging = false;
var milkDragging = false;

var bowlState = 0;

# 0 = Empty, 1 = Cereal, 2 = Milk, 3 = Both

var cerealTimer;

var hasCereal = false;
var cerealSoggy = false;

var winStarted = false;

var heaterOn = false;

var heaterPower = 10000;

var showFPS = false;

var skunkProgress = 0; 

var cerealEaten = false;

var cerealAmount = 10;

var placeCerealVisibilitySet = false;

var waiting = false;

var cerealCounting = false;

var timeSincePowerRanOut = 0;

var muteButtonClicked = false;

var cerealEaten2 = false;

var androEmpty = preload("res://Assets/Sprites/Cameras/androRoom/androEmpty.png");
var androStageFour = preload("res://Assets/Sprites/Cameras/androRoom/androStageFour.png");
var androStageOne = preload("res://Assets/Sprites/Cameras/androRoom/androStageOne.png");
var androStageThree = preload("res://Assets/Sprites/Cameras/androRoom/androStageThree.png");
var androStageTwo = preload("res://Assets/Sprites/Cameras/androRoom/androStageTwo.png");

var bathroomEmpty = preload("res://Assets/Sprites/Cameras/bathrooms/bathroomEmpty.png");
var bathroomSocks = preload("res://Assets/Sprites/Cameras/bathrooms/bathroomSocks.png");

var eatingRoomBoth = preload("res://Assets/Sprites/Cameras/eatingRoom/eatingRoomBoth.png");
var eatingRoomChip = preload("res://Assets/Sprites/Cameras/eatingRoom/eatingRoomChip.png");
var eatingRoomEmpty = preload("res://Assets/Sprites/Cameras/eatingRoom/eatingRoomEmpty.png");
var eatingRoomSocks = preload("res://Assets/Sprites/Cameras/eatingRoom/eatingRoomSocks.png");

var frontHallwayLowerChip = preload("res://Assets/Sprites/Cameras/hallways/frontHallwayLowerChip.png");
var frontHallwayLowerEmpty = preload("res://Assets/Sprites/Cameras/hallways/frontHallwayLowerEmpty.png");
var frontHallwayUpperChip = preload("res://Assets/Sprites/Cameras/hallways/frontHallwayUpperChip.png");
var frontHallwayUpperEmpty = preload("res://Assets/Sprites/Cameras/hallways/frontHallwayUpperEmpty.png");
var leftHallwayChipRegular = preload("res://Assets/Sprites/Cameras/hallways/leftHallwayChipRegular.png");
var leftHallwayChipSoggy = preload("res://Assets/Sprites/Cameras/hallways/leftHallwayChipSoggy.png");
var leftHallwayChipEmpty = preload("res://Assets/Sprites/Cameras/hallways/leftHallwayEmpty.png");
var rightHallwayEmpty = preload("res://Assets/Sprites/Cameras/hallways/rightHallwayEmpty.png");
var rightHallwaySocks = preload("res://Assets/Sprites/Cameras/hallways/rightHallwaySocks.png");

var kitchenEmpty = preload("res://Assets/Sprites/Cameras/kitchen/kitchenEmpty.png");
var kitchenSocks = preload("res://Assets/Sprites/Cameras/kitchen/kitchenSocks.png");

var partsRoomChip = preload("res://Assets/Sprites/Cameras/partsRoom/partsRoomChip.png");
var partsRoomEmpty = preload("res://Assets/Sprites/Cameras/partsRoom/partsRoomEmpty.png");

var stageChipGone = preload("res://Assets/Sprites/Cameras/stage/stageChipGone.png");
var stageEmpty = preload("res://Assets/Sprites/Cameras/stage/stageEmpty.png");
var stageRegular = preload("res://Assets/Sprites/Cameras/stage/stageRegular.png");
var stageSocksGone = preload("res://Assets/Sprites/Cameras/stage/stageSocksGone.png");

func win():
	timeLabel.text = "6:00 AM";
	
	chipLevel = 0;
	socksLevel = 0;
	skunkLevel = 0;
	androLevel = 0;
	
	fadeOut();

	await get_tree().create_timer(3).timeout;
		
	winText.visible = true;
		
	await get_tree().create_timer(1.5).timeout;
		
	yay.play();
		
	await get_tree().create_timer(4).timeout;
		
	get_tree().change_scene_to_file("res://Nights/nightFourEnter.tscn");

func socksJumpscare():
	chipLazy = true;
	socksLazy = true;
	skunkLazy = true;
	androLazy = true;
	
	inJumpscare = true;
	
	message.volume_db = -80;
	
	darkness.modulate.a = 1;
	
	penis.stop();

	border.visible = false;

	cameraLayout.visible = false;
	
	cameraButtons.visible = false;
	
	cameraView.visible = false;

	canFlipCamera = false;
	
	jumpscareSocks.visible = true;
	
	socksJumpscareSound.play();
	
	await get_tree().create_timer(2).timeout;
	
	chipJumpscareSound.set_volume_db(-100);
	
	await get_tree().create_timer(1).timeout;
	
	get_tree().change_scene_to_file("res://Nights/nightThreeEnter.tscn");

func chipJumpscare():
	chipLazy = true;
	socksLazy = true;
	skunkLazy = true;
	androLazy = true;
	
	inJumpscare = true;
	
	message.volume_db = -80;
	
	darkness.modulate.a = 1;
	
	penis.stop();

	border.visible = false;

	cameraLayout.visible = false;
	
	cameraButtons.visible = false;
	
	cameraView.visible = false;

	canFlipCamera = false;
	
	jumpscareChip.visible = true;
	
	chipJumpscareSound.play();
	
	await get_tree().create_timer(2).timeout;
	
	chipJumpscareSound.set_volume_db(-100);
	
	await get_tree().create_timer(1).timeout;
	
	get_tree().change_scene_to_file("res://Nights/nightThreeEnter.tscn");

func fadeIn():
	var tween = create_tween();
	
	tween.tween_property(darkness, "modulate:a", 0, 3).from(1);

func fadeOut():
	var tween2 = create_tween();
		
	tween2.tween_property(darkness, "modulate:a", 1, 3).from(0);

func _process(_delta):
	var camera = penisTwo.get("camera");
	
	var powerDisplay = str(heaterPower/100);
	
	heaterPowerText.text = powerDisplay + "%";
	
	if skunkVentCrawl.playing == false:
		skunkVentCrawl.play();
	
	if camera != 7 && camera != 5:
		shootGlock.visible = false;
	
	if hasCereal == false:
		placeCereal.visible = false;
	
	if Input.is_action_pressed("Secret1"):
		if Input.is_action_pressed("Secret2"):
			time = 60;
		if Input.is_action_just_pressed("Secret3"):
			time = 460;
		if Input.is_action_just_pressed("Secret4"):
			if showFPS == false:
				showFPS = true;
			elif showFPS == true:
				showFPS = false;
	
	if camera == 1:
		placeCerealVisibilitySet = false;
		placeCereal.visible = false;
		
		if chipCamera == 1 && socksCamera == 1:
			cameraView.set_texture(stageRegular);
		elif chipCamera != 1 && socksCamera == 1:
			cameraView.set_texture(stageChipGone);
		elif chipCamera == 1 && socksCamera != 1:
			cameraView.set_texture(stageSocksGone);
		elif chipCamera != 1 && socksCamera != 1:
			cameraView.set_texture(stageEmpty);
	elif camera == 2:
		placeCerealVisibilitySet = false;
		placeCereal.visible = false;
		
		if chipCamera == 2 && socksCamera != 2:
			cameraView.set_texture(eatingRoomChip);
		elif chipCamera != 2 && socksCamera != 2:
			cameraView.set_texture(eatingRoomEmpty);
		elif chipCamera != 2 && socksCamera == 2:
			cameraView.set_texture(eatingRoomSocks);
		elif chipCamera == 2 && socksCamera == 2:
			cameraView.set_texture(eatingRoomBoth);
	elif camera == 3:
		placeCerealVisibilitySet = false;
		placeCereal.visible = false;
		
		if chipCamera == 3:
			cameraView.set_texture(partsRoomChip);
		elif chipCamera != 3:
			cameraView.set_texture(partsRoomEmpty);
	elif camera == 4:
		placeCerealVisibilitySet = false;
		placeCereal.visible = false;
		
		if chipCamera == 4:
			cameraView.set_texture(frontHallwayUpperChip);
		elif chipCamera != 4:
			cameraView.set_texture(frontHallwayUpperEmpty);
	elif camera == 5:
		placeCerealVisibilitySet = false;
		placeCereal.visible = false;
		
		if chipCamera == 5:
			cameraView.set_texture(frontHallwayLowerChip);
		elif chipCamera != 5:
			cameraView.set_texture(frontHallwayLowerEmpty);
	elif camera == 6:
		if hasCereal == true && cameraUp == true:
			if placeCerealVisibilitySet == false:
				placeCereal.visible = true;
			
				placeCerealVisibilitySet = true;
		else:
			placeCereal.visible = false;
		
		if chipCamera == 4.5:
			placeCereal.visible = false;
			
			if cerealSoggy == true:
				cameraView.set_texture(leftHallwayChipSoggy);
			elif cerealSoggy == false:
				cameraView.set_texture(leftHallwayChipRegular);
		if chipCamera != 4.5:
			cameraView.set_texture(leftHallwayChipEmpty);
	elif camera == 7:
		placeCerealVisibilitySet = false;
		placeCereal.visible = false;
		
		if socksCamera == 9:
			cameraView.set_texture(rightHallwaySocks);
		elif socksCamera != 9:
			cameraView.set_texture(rightHallwayEmpty);
	elif camera == 8:
		placeCerealVisibilitySet = false;
		placeCereal.visible = false;
		
		if socksCamera == 8:
			cameraView.set_texture(bathroomSocks);
		elif socksCamera != 8:
			cameraView.set_texture(bathroomEmpty);
	elif camera == 9:
		placeCerealVisibilitySet = false;
		placeCereal.visible = false;
		
		if socksCamera == 7:
			cameraView.set_texture(kitchenSocks);
		elif socksCamera != 7:
			cameraView.set_texture(kitchenEmpty);
	elif camera == 0:
		placeCerealVisibilitySet = false;
		placeCereal.visible = false;
	
	mouseX = get_global_mouse_position().x;
	mouseY = get_global_mouse_position().y;
	
	if fadedIn == true && cameraUp != true:
		if mouseX < 641 && officeX < 1920 && inJumpscare == false:
			officeX += 20;
		elif mouseX > 1279 && officeX > 0 && inJumpscare == false:
			officeX -= 20;
	
		office.position = Vector2(officeX, 540);
		
	if mouseY > 951:
		mouseOnCameraButton = true;
		
		if canFlipCamera == true && inJumpscare == false && makingCereal == false && fadedIn == true:
			cameraFlip.play();
			
			if cameraUp == false:
				cameraUp = true;
				
				penis.play();
				
				border.visible = true;
				
				cameraLayout.visible = true;
				
				cameraButtons.visible = true;
				
				cameraView.visible = true;
				
				cameraTextNode.visible = true;
				
				heaterButton.visible = true;
				
				heaterPowerText.visible = true;
				
				canFlipCamera = false;
				
				cerealButton.visible = false;
				
				if heaterOn == false:
					heaterCheckOff.visible = true;
					heaterText.visible = true;
				elif heaterOn == true:
					heaterCheckOn.visible = true;
					heaterText.visible = true;
			elif cameraUp == true:
				placeCerealVisibilitySet = false;
				
				shootGlock.visible = false;
				
				cameraUp = false;
				
				penis.stop();
				
				border.visible = false;
				
				cameraLayout.visible = false;
				
				cameraButtons.visible = false;
				
				cameraView.visible = false;
				
				cameraTextNode.visible = false;
				
				placeCereal.visible = false;
				
				heaterCheckOn.visible = false;
				heaterCheckOff.visible = false;
				heaterText.visible = false;
				heaterButton.visible = false;
				heaterPowerText.visible = false;
				
				canFlipCamera = false;
				
				cerealButton.visible = true;
	else:
		canFlipCamera = true;

	if mouseX > 1805:
		if canMakeCereal == true && inJumpscare == false && cameraUp == false && fadedIn == true:
			if makingCereal == true && milkDragging == false && cerealDragging == false && bowlState == 0:
				cerealStation.visible = false;
				cereal.visible = false;
				milk.visible = false;
				bowlEmpty.visible = false;
				bowlCereal.visible = false;
				bowlCum.visible = false;
				mess.visible = false;
			
				makingCereal = false;
			
				canMakeCereal = false;
				
				cameraButton.visible = true;
			elif makingCereal == false:
				if cerealEaten != true && cerealAmount != 0:
					cereal.visible = true;
					milk.visible = true;
				elif cerealEaten == true:
					mess.visible = true;
				
				cerealStation.visible = true;
				bowlEmpty.visible = true;
			
				makingCereal = true;
			
				canMakeCereal = false;
				
				cameraButton.visible = false;
			elif cerealEaten2:
				mess.visible = true;
	else:
		canMakeCereal = true;

	if milkDragging == true:
		milk.position = Vector2(mouseX, mouseY);
	
	if cerealDragging == true:
		cereal.position = Vector2(mouseX, mouseY);

func _ready():
	Engine.max_fps = 60;
	
	fadeIn();
	
	await get_tree().create_timer(3).timeout;
	
	fadedIn = true;
	
	message.play();
	
	await get_tree().create_timer(77).timeout;
	
	message.set_volume_db(-100);

	muteMessage.visible = false;

func _on_timer_timeout():
	time += 1;
	
	if showFPS == true:
		print(str(Engine.get_frames_per_second()));
	
	if time > 59 && time < 121:
		timeLabel.text = "1:00 AM";
		
		chipLevel = 6;
		socksLevel = 4;
	elif time > 119 && time < 181:
		timeLabel.text = "2:00 AM";
		
		chipLevel = 10;
		socksLevel = 7;
		skunkLevel = 6;
	elif time > 179 && time < 241:
		timeLabel.text = "3:00 AM";
	elif time > 319 && time < 401:
		timeLabel.text = "4:00 AM";
	elif time > 400 && time < 461:
		timeLabel.text = "5:00 AM";
	
	if time > 459 && winStarted == false:
		win();
		
		winStarted = true;

func _on_timer_2_timeout():
	var rng = RandomNumberGenerator.new();
	
	rng.seed = mouseX/mouseY+time;
	
	chipRandom = rng.randi_range(0, 20);
	skunkRandom = rng.randi_range(0, 20);
	androRandom = rng.randi_range(0, 20);

	if chipRandom < chipLevel || chipRandom == chipLevel || chipGodMode == true:
		if chipLazy == false:
			if chipCamera == 1:
				chipCamera = 2;
				
				characterMove.volume_db = 10;
			elif chipCamera == 2:
				if chipRandom == 10:
					chipCamera = 3;
				else:
					chipCamera = 4;
				
				characterMove.volume_db = 12;
			elif chipCamera == 3:
				chipCamera = 2;
				
				characterMove.volume_db = 14;
			elif chipCamera == 4:
				chipCamera = 5;
				
				characterMove.volume_db = 16;
			elif chipCamera == 5:
				chipJumpscare();
			
			characterMove.play();
	
	if skunkRandom < skunkLevel || skunkRandom == skunkLevel:
		pass

	if androRandom < androLevel || chipRandom == chipLevel:
		pass

func _on_timer_socks_timeout():
	var rng = RandomNumberGenerator.new();
	
	rng.seed = mouseX/mouseY+time;
	
	socksRandom = rng.randi_range(0, 20);
	
	if socksRandom < socksLevel || socksRandom == socksLevel || socksGodMode == true && socksLazy != true:
		if socksCamera == 1:
			socksCamera = 2;
			
			characterMove.volume_db = 10;
		elif socksCamera == 2:
			if socksRandom == 10:
				socksCamera = 7;
				
				characterMove.volume_db = 13;
			elif socksRandom == 11:
				socksCamera = 8;
				
				characterMove.volume_db = 13;
			else:
				socksCamera = 9;
				
				characterMove.volume_db = 16;
			
			characterMove.volume_db = 12;
		elif socksCamera == 7:
			socksCamera = 2;
		elif socksCamera == 8:
			socksCamera = 2;
		elif socksCamera == 9:
			socksJumpscare();
		
		characterMove.play();

func _on_mute_call_button_up():
	if !muteButtonClicked:
		muteButtonClicked = true;
		
		
		message.set_volume_db(-100);
	
		inJumpscare = true;

		messageMuted.play();
	
		await get_tree().create_timer(8).timeout;

		get_tree().change_scene_to_file("res://mainMenu.tscn");

func _on_milk_button_button_up():
	if cerealDragging == false && bowlState != 2 && bowlState != 3 && makingCereal == true && hasCereal == false && cerealEaten == false && cerealAmount != 0:
		milkDragging = true;

func _on_cereal_button_button_up():
	if milkDragging == false && bowlState == 0 && makingCereal == true && hasCereal == false && cerealEaten == false && cerealAmount != 0:
		cerealDragging = true;

func _on_bowl_area_area_entered(area):
	if area.name == "cerealArea" && makingCereal == true && waiting == false:
		waiting = true;
		
		print("Cereal entered area.");
		
		cereal.visible = false;
		cerealPour.visible = true;
		
		await get_tree().create_timer(2).timeout;
		
		bowlEmpty.visible = false;
		bowlCereal.visible = true;
		
		bowlState = 1;
		
		cerealPour.visible = false;
		
		cerealDragging = false;
		
		cereal.position = Vector2(1055, 554);
		cereal.visible = true;
		
		waiting = false;
		
	elif area.name == "milkArea" && makingCereal == true && waiting == false:
		waiting = true;
		
		milk.visible = false;
		milkPour.visible = true;
		
		await get_tree().create_timer(2).timeout;

		waiting = false;

		if bowlState == 1:
			bowlCereal.visible = false;
			bowlBoth.visible = true;
		
			bowlState = 3;
		
			milkPour.visible = false;
		
			milkDragging = false;
		
			milk.position = Vector2(1290, 534);
			milk.visible = true;
			
			clickMe.visible = true;
			
		elif bowlState == 0 && waiting == false:
			waiting = true;
			
			bowlEmpty.visible = false;
			bowlCum.visible = true;
		
			bowlState = 2;
		
			milkPour.visible = false;
		
			milkDragging = false;
		
			milk.position = Vector2(1290, 534);
			milk.visible = true;

			inJumpscare = true;

			milkCrime.playing = true;
			message.playing = false;
			
			await get_tree().create_timer(6).timeout;
			
			chipJumpscare();

			waiting = false;

func _on_cereal_done_button_button_up():
	if bowlState == 3:
		hasCereal = true;
		
		cerealTimer = 10;
	
		bowlState = 0;

		cerealAmount -= 1;
		
		cerealAmountLabel.text = "You have " + str(cerealAmount) + " cereal.";

		bowlBoth.visible = false;
		bowlEmpty.visible = true;
		clickMe.visible = false;
	
		bowlTimer.visible = true;
		cerealTimerLabel.visible = true;
	
		cerealCounting = true;
	
		cerealTimer2.start();
	
func _on_cereal_timer_timeout():
	if cerealCounting == true:
		if cerealTimer != 0:
			cerealTimer -= 1;
		
			cerealTimerLabel.text = str(cerealTimer);
		
		if cerealTimer == 0 && hasCereal == true && waiting == false:
			waiting = true;
			
			cerealTimerLabel.visible = false;
			bowlTimer.visible = false;
			
			cerealSoggy = true;
		
			soggyCereal.visible = true;
			
			await get_tree().create_timer(3).timeout;
			
			soggyCereal.visible = false;
			
			cerealCounting = false;
			
			waiting = false;
	else:
		cerealTimer = 10;
		
		cerealTimerLabel.text = str(10);

func _on_shoot_glock_button_up():
	gunShot.play();
	
	if cameraButtons.camera == 7:
		socksLazy = true;
		
		await get_tree().create_timer(1).timeout;
	
		socksShot.play();
	
		await get_tree().create_timer(3).timeout;

		socksCamera = 1;
		
		socksLazy = false;
	elif cameraButtons.camera == 5:
		await get_tree().create_timer(1).timeout;
		
		chipShot.play();

		await get_tree().create_timer(2).timeout;
		
		chipJumpscare();

func _on_heater_button_button_up():
	if heaterOn == false:
		heaterOn = true;
		
		heaterCheckOff.visible = false;
		heaterCheckOn.visible = true;
	elif heaterOn == true:
		heaterOn = false;

		heaterCheckOff.visible = true;
		heaterCheckOn.visible = false;

func _on_heater_power_timer_timeout():
	if heaterOn == true && heaterPower != 0:
		heaterPower -= 100;
	elif heaterPower == 0:
		timeSincePowerRanOut += 1;
		
		if timeSincePowerRanOut == 180:
			heaterPower = 10000;
			
			timeSincePowerRanOut = 0;

func _on_skunk_timer_timeout():
	if heaterOn == true && cerealEaten == false:
		if skunkProgress == 3:
			skunkProgress = 2;
		elif skunkProgress == 2:
			skunkProgress = 1;
		elif skunkProgress == 1:
			skunkProgress = 0;
		
		print(str(skunkProgress));
	elif heaterOn != true:
		var rng = RandomNumberGenerator.new();
	
		rng.seed = mouseX/mouseY+time;
		
		skunkRandom = rng.randi_range(0, 20);
		
		if skunkRandom < skunkLevel || skunkRandom == skunkLevel || skunkGodMode == true && skunkLazy != true:
			skunkProgress += 1;
			
			if skunkProgress == 4:
				pass

	if skunkProgress == 0 || skunkProgress == 4:
		skunkVentCrawl.volume_db = -80;
	elif skunkProgress == 1:
		skunkVentCrawl.volume_db = 3;
	elif skunkProgress == 2:
		skunkVentCrawl.volume_db = 6;
	elif skunkProgress == 3:
		skunkVentCrawl.volume_db = 12;

func _on_place_cereal_button_up():
	cerealCounting = false;
	
	hasCereal = false;
	
	bowlTimer.visible = false;
	cerealTimerLabel.visible = false;

	if chipCamera == 5:
		chipCamera = 4.5;
		
		if cerealSoggy == false && waiting == false:
			waiting = true;
			
			cerealEatenNormal.play();
			
			await get_tree().create_timer(2.5).timeout;
			
			chipCamera = 1;
			
			waiting = false;
		elif cerealSoggy == true && waiting == false:
			waiting = true;
			
			cerealEatenSoggy.play();
			
			await get_tree().create_timer(3).timeout;
			
			chipJumpscare();
			
			waiting = false;
