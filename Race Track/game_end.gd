extends Node2D

func _ready():
	unlock_saoj()


func unlock_saoj():
	if Globals.level_1_high_score > 0 && Globals.level_2_high_score > 0 && Globals.level_3_high_score > 0:
		Globals.SAOj_toggleable = true
