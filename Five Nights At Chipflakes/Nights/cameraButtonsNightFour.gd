extends Node2D

# I called it penis for the same reason I did for the other script. If you get angry over this then fuck you.

@export var cameraView : Sprite2D

@export var cameraText : Label

@export var cam0L : Node
@export var cam1AL : Node
@export var cam1BL : Node
@export var cam2L : Node
@export var cam3L : Node
@export var cam4L : Node
@export var cam5AL : Node
@export var cam6AL : Node
@export var cam5BL : Node
@export var cam6BL : Node

@export var placeCereal : Node
@export var penis : Node2D
@export var script2 : Node
@export var shootGlock : Node

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

var camera = 1;

func _on_cam_0_button_up():
	cam0L.visible = true;
	
	cam1AL.visible = false;
	cam1BL.visible = false;
	cam2L.visible = false;
	cam3L.visible = false;
	cam4L.visible = false;
	cam5AL.visible = false;
	cam6AL.visible = false;
	cam5BL.visible = false;
	cam6BL.visible = false;
	
	cameraText.text = "Backstage";
	
	camera = 0;
	
	cameraView.set_texture(androStageOne);
	
func _on_cam_1a_button_up():
	cam1AL.visible = true;
	
	cam0L.visible = false;
	cam1BL.visible = false;
	cam2L.visible = false;
	cam3L.visible = false;
	cam4L.visible = false;
	cam5AL.visible = false;
	cam6AL.visible = false;
	cam5BL.visible = false;
	cam6BL.visible = false;

	cameraText.text = "Main Stage";

	camera = 1;

	if penis.get("chipCamera") == 1 && penis.get("socksCamera") == 1:
		cameraView.set_texture(stageRegular);
	elif penis.get("chipCamera") != 1 && penis.get("socksCamera") == 1:
		cameraView.set_texture(stageChipGone);
	elif penis.get("chipCamera") != 1 && penis.get("socksCamera") != 1:
		cameraView.set_texture(stageEmpty);
	elif penis.get("chipCamera") == 1 && penis.get("socksCamera") != 1:
		cameraView.set_texture(stageSocksGone);

func _on_cam_1b_button_up():
	cam1BL.visible = true;

	cam2L.visible = false;
	cam1AL.visible = false;
	cam0L.visible = false;
	cam3L.visible = false;
	cam4L.visible = false;
	cam5AL.visible = false;
	cam6AL.visible = false;
	cam5BL.visible = false;
	cam6BL.visible = false;

	cameraText.text = "Dining Room";

	camera = 2;

	if penis.chipCamera == 2 && penis.socksCamera != 2:
		cameraView.set_texture(eatingRoomChip);
	if penis.chipCamera != 2 && penis.socksCamera == 2:
		cameraView.set_texture(eatingRoomSocks);
	if penis.chipCamera != 2 && penis.socksCamera != 2:
		cameraView.set_texture(eatingRoomEmpty);
	if penis.chipCamera == 2 && penis.socksCamera == 2:
		cameraView.set_texture(eatingRoomBoth);

func _on_cam_2_button_up():
	cam2L.visible = true;
	
	cam1BL.visible = false;
	cam1AL.visible = false;
	cam0L.visible = false;
	cam3L.visible = false;
	cam4L.visible = false;
	cam5AL.visible = false;
	cam6AL.visible = false;
	cam5BL.visible = false;
	cam6BL.visible = false;
	
	cameraText.text = "Parts Room";
	
	camera = 3;
	
	if penis.get("chipCamera") != 3:
		cameraView.set_texture(partsRoomEmpty);
	elif penis.get("chipCamera") == 3:
		cameraView.set_texture(partsRoomChip);

func _on_cam_3_button_up():
	cam3L.visible = true;
	
	cam2L.visible = false;
	cam1BL.visible = false;
	cam1AL.visible = false;
	cam0L.visible = false;
	cam4L.visible = false;
	cam5AL.visible = false;
	cam6AL.visible = false;
	cam5BL.visible = false;
	cam6BL.visible = false;
	
	cameraText.text = "Kitchen";
	
	camera = 9;
	
	if penis.socksCamera != 7:
		cameraView.set_texture(kitchenEmpty);
	elif penis.socksCamera == 7:
		cameraView.set_texture(kitchenSocks);

func _on_cam_4_button_up():
	cam4L.visible = true;
	
	cam3L.visible = false;
	cam2L.visible = false;
	cam1BL.visible = false;
	cam1AL.visible = false;
	cam0L.visible = false;
	cam5AL.visible = false;
	cam6AL.visible = false;
	cam5BL.visible = false;
	cam6BL.visible = false;
	
	cameraText.text = "Bathrooms";
	
	camera = 8;
	
	if penis.socksCamera != 8:
		cameraView.set_texture(bathroomEmpty);
	elif penis.socksCamera == 8:
		cameraView.set_texture(bathroomSocks);

func _on_cam_6a_button_up():
	cam6AL.visible = true;
	
	cam4L.visible = false;
	cam3L.visible = false;
	cam2L.visible = false;
	cam1BL.visible = false;
	cam1AL.visible = false;
	cam0L.visible = false;
	cam5AL.visible = false;
	cam5BL.visible = false;
	cam6BL.visible = false;

	cameraText.text = "Right Hallway";

	camera = 7;

	if penis.socksCamera != 9:
		cameraView.set_texture(rightHallwayEmpty);
		
		shootGlock.visible = false;
	elif penis.socksCamera == 9:
		cameraView.set_texture(rightHallwaySocks);
		
		shootGlock.visible = true;

func _on_cam_6b_button_up():
	cam6BL.visible = true;
	
	cam6AL.visible = false;
	cam4L.visible = false;
	cam3L.visible = false;
	cam2L.visible = false;
	cam1BL.visible = false;
	cam1AL.visible = false;
	cam0L.visible = false;
	cam5AL.visible = false;
	cam5BL.visible = false;
	
	cameraText.text = "Left Hallway";
	
	camera = 6;
	
	if script2.chipCamera != 4.5:
		cameraView.set_texture(leftHallwayChipEmpty);
	if script2.chipCamera == 4.5 && script2.cerealSoggy == false:
		cameraView.set_texture(leftHallwayChipRegular);
	if script2.chipCamera == 4.5 && script2.cerealSoggy == true:
		cameraView.set_texture(leftHallwayChipSoggy);
	
	if script2.hasCereal == true:
		placeCereal.visible = true;

func _on_cam_5b_button_up():
	cam5BL.visible = true;
	
	cam6BL.visible = false;
	cam6AL.visible = false;
	cam4L.visible = false;
	cam3L.visible = false;
	cam2L.visible = false;
	cam1BL.visible = false;
	cam1AL.visible = false;
	cam0L.visible = false;
	cam5AL.visible = false;
	
	cameraText.text = "Front Hallway Lower";
	
	camera = 5;
	
	if penis.get("chipCamera") != 5:
		cameraView.set_texture(frontHallwayLowerEmpty);
		
		shootGlock.visible = false;
	elif penis.get("chipCamera") == 5:
		cameraView.set_texture(frontHallwayLowerChip)
		
		shootGlock.visible = true;

func _on_cam_5a_button_up():
	cam5AL.visible = true;
	
	cam0L.visible = false;
	cam1AL.visible = false;
	cam1BL.visible = false;
	cam2L.visible = false;
	cam3L.visible = false;
	cam4L.visible = false;
	cam6AL.visible = false;
	cam5BL.visible = false;
	cam6BL.visible = false;

	cameraText.text = "Front Hallway Upper";

	camera = 4;

	if penis.get("chipCamera") != 4:
		cameraView.set_texture(frontHallwayUpperEmpty);
	elif penis.get("chipCamera") == 4:
		cameraView.set_texture(frontHallwayUpperChip);
