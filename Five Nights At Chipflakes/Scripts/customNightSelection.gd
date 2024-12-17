extends Node2D

@export var chipLevelLabel : Label
@export var socksLevelLabel : Label
@export var skunkLevelLabel : Label
@export var androLevelLabel : Label
@export var darkness : Node
@export var immature : AudioStreamPlayer2D

var chipLevel = 0;
var socksLevel = 0;
var skunkLevel = 0;
var androLevel = 0;

func _ready():
	fadeIn();
	
func fadeIn():
	var tween = create_tween();
	
	tween.tween_property(darkness, "modulate:a", 0, 3).from(1);

func fadeOut():
	var tween2 = create_tween();
		
	tween2.tween_property(darkness, "modulate:a", 1, 3).from(0);

func _on_chip_left_arrow_button_up():
	if chipLevel != 0:
		chipLevel -= 1;

	chipLevelLabel.text = str(chipLevel);

func _on_chip_right_arrow_button_up():
	if chipLevel != 20:
		chipLevel += 1;
	
	chipLevelLabel.text = str(chipLevel);

func _on_socks_left_arrow_pressed():
	if socksLevel != 0:
		socksLevel -= 1;
	
	socksLevelLabel.text = str(socksLevel);

func _on_socks_right_arrow_button_up():
	if socksLevel != 20:
		socksLevel += 1;
		
	socksLevelLabel.text = str(socksLevel);

func _on_skunk_left_arrow_button_up():
	if skunkLevel != 0:
		skunkLevel -= 1;

	skunkLevelLabel.text = str(skunkLevel);

func _on_skunk_right_arrow_button_up():
	if skunkLevel != 20:
		skunkLevel += 1;
	
	skunkLevelLabel.text = str(skunkLevel);

func _on_andro_left_arrow_button_up():
	if androLevel != 0:
		androLevel -= 1;
		
	androLevelLabel.text = str(androLevel);

func _on_andro_right_arrow_button_up():
	if androLevel != 20:
		androLevel += 1;

	androLevelLabel.text = str(androLevel);

func _on_start_button_up():
	CustomNightLevels.chipLevel = chipLevel;
	CustomNightLevels.socksLevel = socksLevel;
	CustomNightLevels.skunkLevel = skunkLevel;
	CustomNightLevels.androLevel = androLevel;
	
	if chipLevel == 6 || socksLevel == 9 || skunkLevel == 6 && androLevel == 9:
		immature.play();
		
		await get_tree().create_timer(20).timeout;
		
		get_tree().change_scene_to_file("res://Scenes/mainMenu.tscn");
	else:
		fadeOut();

		await get_tree().create_timer(3).timeout;
	
		get_tree().change_scene_to_file("res://Nights/nightSevenEnter.tscn");
