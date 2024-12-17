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
	camera = 0;
	
	cameraView.set_texture(androStageOne);
	
func _on_cam_1a_button_up():
	camera = 1;
	
	cameraText.text = "Main Stage";

func _on_cam_1b_button_up():
	camera = 2;
	
	cameraText.text = "Dining Room";
	
func _on_cam_2_button_up():
	camera = 3;
	
	cameraText.text = "Parts Room";

func _on_cam_3_button_up():
	camera = 9;
	
	cameraText.text = "Kitchen";

func _on_cam_4_button_up():
	camera = 8;
	
	cameraText.text = "Bathrooms";

func _on_cam_6a_button_up():
	camera = 7;
	
	cameraText.text = "Right Hallway";

func _on_cam_6b_button_up():
	camera = 6;
	
	cameraText.text = "Left Hallway";

func _on_cam_5b_button_up():
	camera = 5;
	
	cameraText.text = "Front Hallway Lower";

func _on_cam_5a_button_up():
	camera = 4;

	cameraText.text = "Front Hallway Upper";
