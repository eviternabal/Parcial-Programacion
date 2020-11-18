extends Node

var levels = [
	"res://scenes/levels/Level 1.tscn",
	"res://scenes/levels/Level 2.tscn",
	"res://scenes/levels/Level 3.tscn"
]

var level_score = 0

var level_time = 0

func new_high_score():
	if level_1_last_score > level_1_high_score:
		level_1_high_score = level_1_last_score

	if level_2_last_score > level_2_high_score:
		level_2_high_score = level_2_last_score

	if level_3_last_score > level_3_high_score:
		level_3_high_score = level_3_last_score

var current_level = 0

var level_1_high_score = 0

var level_2_high_score = 0

var level_3_high_score = 0

var level_1_last_score = 0

var level_2_last_score = 0

var level_3_last_score = 0

var last_collectables = ""

var SAOj_toggleable = false
var SAOj_mode = false
