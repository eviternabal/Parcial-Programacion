extends Node2D

var scene_lvlselect = load("res://scenes/test.tscn")
var scene_credits = load("res://scenes/credits.tscn")


func _on_lvlselector_pressed():
	get_tree().change_scene_to(scene_lvlselect)


func _on_credits_pressed():
	get_tree().change_scene_to(scene_credits)


func _on_quit_pressed():
	get_tree().quit()

