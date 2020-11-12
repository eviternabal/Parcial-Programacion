extends Node2D

var scene_mainmenu = load("res://scenes/menu.tscn")

func _on_back_pressed():
	get_tree().change_scene_to(scene_mainmenu)
