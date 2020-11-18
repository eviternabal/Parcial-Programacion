extends Node

var level_time = 0
var score = 0
var collectibles = 0
var car_model = car
var car = ""

func check_saoj():
	if Globals.SAOj_mode == true:
		car = load("res://scenes/car/fitito.tscn")
	else:
		car = load("res://scenes/car/car.tscn")

func _ready():
	check_saoj()
	spawn()
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

	var total_collectables = get_tree().get_nodes_in_group("pickups")
	$UI/collectibles_text.text = ("Collectibles: " + str(collectibles) + "/" + str(total_collectables.size()))

func spawn():
	$spawner.add_child(car.instance())


func _on_goal_reached():
	score = collectibles*100 - level_time*50
	if score > 0:
		Globals.level_time = level_time
		if Globals.current_level == 0:
			Globals.level_1_last_score = score
			Globals.level_score = score
		if Globals.current_level == 1:
			Globals.level_2_last_score = score
			Globals.level_score = score
		if Globals.current_level == 2:
			Globals.level_3_last_score = score
			Globals.level_score = score
		
	else:
		score = 0
		Globals.level_time = level_time
		if Globals.current_level == 0:
			Globals.level_1_last_score = score
			Globals.level_score = score
		if Globals.current_level == 1:
			Globals.level_2_last_score = score
			Globals.level_score = score
		if Globals.current_level == 2:
			Globals.level_3_last_score = score
			Globals.level_score = score

	Globals.new_high_score()
	score -= collectibles*100 - level_time
	get_tree().change_scene("res://scenes/screens/LevelClear.tscn")

	Globals.last_collectables = str($UI/collectibles_text.text)

func _on_timer_timeout():
	level_time += 1
	$UI/time_text.set_text("Time: " + str(level_time))

func on_pickup_pickuped():
	var total_collectables = get_tree().get_nodes_in_group("pickups")
	collectibles += 1
	$UI/collectibles_text.text = ("Collectibles: " + str(collectibles) + "/" + str(total_collectables.size()))


func _on_deathwall_body_entered(body):
	get_tree().reload_current_scene()
