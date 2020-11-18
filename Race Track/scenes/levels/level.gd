extends Node

var level_time = 0

func _ready():
	level_time = 0
	## Conectar señales de los goals
	var goals = get_tree().get_nodes_in_group("goals")
	
	for goal in goals:
		goal.connect("level_won", self, "_on_goal_reached")
	
	var timers = get_tree().get_nodes_in_group("timers")
	for timer in timers:
		timer.connect("timeout", self, "_on_timer_timeout")

func _on_goal_reached():
	get_tree().change_scene("res://scenes/screens/LevelClear.tscn")

func _on_timer_timeout():
	level_time += 1
	$UI/Label.set_text("Time: " + str(level_time))
