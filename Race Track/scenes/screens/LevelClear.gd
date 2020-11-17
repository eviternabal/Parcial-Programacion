extends Control


var scene_lvlselect = load("res://scenes/level_select.tscn")


func _on_lvlselector_pressed():
	get_tree().change_scene_to(scene_lvlselect)

func _on_Retry_pressed():
	get_tree().change_scene(Globals.levels[Globals.current_level])


func _on_Next_level_pressed():
	var next_scene = ""
	Globals.current_level += 1
	if Globals.current_level >= Globals.levels.size():
		next_scene = "res://scenes/credits.tscn"
	else:
		next_scene = Globals.levels[Globals.current_level]
	get_tree().change_scene(next_scene)
