extends Node

var levels = [
	"res://scenes/levels/Level 1.tscn",
	"res://scenes/levels/Level 2.tscn",
	"res://scenes/levels/Level 3.tscn"
]

var level_score = 0

var level_time = 0

func new_high_score(): # Checkea si el last_score es mayor al high_score. De ser así, actualiza el high_score del nivel correspondiente.
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

var last_collectibles = ""

var SAOj_toggleable = false # Si es true permite activar el botón para seleccionar el modo difícil
var SAOj_mode = false # Activa el modo difícil si es true


