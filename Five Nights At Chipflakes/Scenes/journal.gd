extends Node2D

@export var footer : Label

@export var dayOne : Label;
@export var dayTwo : Label;
@export var dayThree : Label;
@export var dayFour : Label;
@export var dayFive : Label;
@export var daySix : Label;

var page = 1;

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass

func _on_exit_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/mainMenu.tscn");

func _on_left_button_up() -> void:
	if page != 1:
		page -= 1;
		
		footer.text = "Page: " + str(page);
		
		if page == 1:
			dayOne.visible = true;
			
			dayTwo.visible = false;
			dayThree.visible = false;
			dayFour.visible = false;
			dayFive.visible = false;
			daySix.visible = false;
		elif page == 2:
			dayTwo.visible = true;
			
			dayOne.visible = false;
			dayThree.visible = false;
			dayFour.visible = false;
			dayFive.visible = false;
			daySix.visible = false;
		elif page == 3:
			dayThree.visible = true;
			
			dayTwo.visible = false;
			dayOne.visible = false;
			dayFour.visible = false;
			dayFive.visible = false;
			daySix.visible = false;
		elif page == 4:
			dayFour.visible = true;
			
			dayTwo.visible = false;
			dayThree.visible = false;
			dayOne.visible = false;
			dayFive.visible = false;
			daySix.visible = false;
		elif page == 5:
			dayFive.visible = true;
			
			dayTwo.visible = false;
			dayThree.visible = false;
			dayFour.visible = false;
			dayOne.visible = false;
			daySix.visible = false;
		elif page == 6:
			daySix.visible = true;
			
			dayTwo.visible = false;
			dayThree.visible = false;
			dayFour.visible = false;
			dayFive.visible = false;
			dayOne.visible = false;

func _on_right_button_up() -> void:
	if page != 6:
		page += 1;
		
		footer.text = "Page: " + str(page);

		if page == 1:
			dayOne.visible = true;
			
			dayTwo.visible = false;
			dayThree.visible = false;
			dayFour.visible = false;
			dayFive.visible = false;
			daySix.visible = false;
		elif page == 2:
			dayTwo.visible = true;
			
			dayOne.visible = false;
			dayThree.visible = false;
			dayFour.visible = false;
			dayFive.visible = false;
			daySix.visible = false;
		elif page == 3:
			dayThree.visible = true;
			
			dayTwo.visible = false;
			dayOne.visible = false;
			dayFour.visible = false;
			dayFive.visible = false;
			daySix.visible = false;
		elif page == 4:
			dayFour.visible = true;
			
			dayTwo.visible = false;
			dayThree.visible = false;
			dayOne.visible = false;
			dayFive.visible = false;
			daySix.visible = false;
		elif page == 5:
			dayFive.visible = true;
			
			dayTwo.visible = false;
			dayThree.visible = false;
			dayFour.visible = false;
			dayOne.visible = false;
			daySix.visible = false;
		elif page == 6:
			daySix.visible = true;
			
			dayTwo.visible = false;
			dayThree.visible = false;
			dayFour.visible = false;
			dayFive.visible = false;
			dayOne.visible = false;
