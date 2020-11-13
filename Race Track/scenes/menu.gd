extends Node2D

var scene_mainmenu = load("res://scenes/menu.tscn")
var scene_lvlselect = load("res://scenes/level_select.tscn")
var scene_credits = load("res://scenes/credits.tscn")
var scene_lvl1 = load("res://scenes/test.tscn")
var scene_lvl2 = load("res://scenes/test.tscn")
var scene_lvl3 = load("res://scenes/test.tscn")

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


