extends Node

func _ready():
	var goals = get_tree().get_nodes_in_group("goals")
	for goal in goals:
		goal.connect("level_won", self, "_on_goal_reached")
		print("connected")

func _on_goal_reached():
	get_tree().change_scene("res://scenes/screens/LevelClear.tscn")
