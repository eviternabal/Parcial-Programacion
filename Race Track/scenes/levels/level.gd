extends Node

var level = Globals.current_level
var level_time = 0
var score = 0
var collectibles = 0

func set_level():
	if get_tree().current_scene.name == "Level 1": 
		Globals.current_level = 0
	if get_tree().current_scene.name == "Level 2":
		Globals.current_level = 1
	if get_tree().current_scene.name == "Level 3":
		Globals.current_level = 2

func _ready():
	set_level()
	print(level)
	level_time = 0
	## Conectar señales de los goals
	var goals = get_tree().get_nodes_in_group("goals")
	for goal in goals:
		goal.connect("level_won", self, "_on_goal_reached")
		
	var timers = get_tree().get_nodes_in_group("timers")
	for timer in timers:
		timer.connect("timeout", self, "_on_timer_timeout")
		
	var pickups = get_tree().get_nodes_in_group("pickups")
	for pickup in pickups:
		pickup.connect ("pickup_pickuped", self, "on_pickup_pickuped")

func _on_goal_reached():
	score -= collectibles*100 - level_time
	
	if Globals.current_level == 0:
		Globals.level_1_last_score = score
		print(Globals.level_1_last_score)
	if Globals.current_level == 1:
		Globals.level_2_last_score = score
	if Globals.current_level == 2:
		Globals.level_3_last_score = score
	
	Globals.new_high_score()
	
	get_tree().change_scene("res://scenes/screens/LevelClear.tscn")

func _on_timer_timeout():
	level_time += 1
	$UI/time_text.set_text("Time: " + str(level_time))

func on_pickup_pickuped():
	collectibles += 1
	print ("sadsdas")
