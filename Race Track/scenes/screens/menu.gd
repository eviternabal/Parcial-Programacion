extends Node2D

var scene_mainmenu = load("res://scenes/screens/menu.tscn")
var scene_lvlselect = load("res://scenes/screens/level_select.tscn")
var scene_credits = load("res://scenes/screens/credits.tscn")
var scene_lvl1 = load("res://scenes/levels/Level 1.tscn")
var scene_lvl2 = load("res://scenes/levels/Level 2.tscn")
var scene_lvl3 = load("res://scenes/levels/Level 3.tscn")
onready var lvl_1_score = get_node("max score labels/lvl 1")
onready var lvl_2_score = get_node("max score labels/lvl 2")
onready var lvl_3_score = get_node("max score labels/lvl 3")
var level_1_high_score = Globals.level_1_high_score
var level_2_high_score = Globals.level_2_high_score
var level_3_high_score = Globals.level_3_high_score

func _ready():
	if get_tree().current_scene.name == "level_select":
		lvl_1_score.text = ("Max score: " + str(level_1_high_score))
		lvl_2_score.text = ("Max score: " + str(level_2_high_score))
		lvl_3_score.text = ("Max score: " + str(level_3_high_score))

func _on_lvlselector_pressed():
	get_tree().change_scene_to(scene_lvlselect)

func _on_credits_pressed():
	get_tree().change_scene_to(scene_credits)

func _on_quit_pressed():
	get_tree().quit()

func _go_to_menu():
	get_tree().change_scene_to(scene_mainmenu)

func _on_lvl_pressed():
	if $"lvl 1".pressed:
		get_tree().change_scene_to(scene_lvl1)
	if $"lvl 2".pressed:
		get_tree().change_scene_to(scene_lvl2)
	if $"lvl 3".pressed:
		get_tree().change_scene_to(scene_lvl3)

