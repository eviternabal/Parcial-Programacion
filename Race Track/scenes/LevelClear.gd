extends Control


var scene_lvlselect = load("res://scenes/level_select.tscn")


func _on_lvlselector_pressed():
	get_tree().change_scene_to(scene_lvlselect)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
