extends Node2D

func check_saoj(): # Si se han jugado todos los niveles, permite activar el modo difícil
	if Globals.level_1_high_score > 0 && Globals.level_2_high_score > 0 && Globals.level_3_high_score > 0:
		Globals.SAOj_toggleable = true
		$FinishScreen/Label.visible = true # Mostrar texto especial

func _ready():
	check_saoj()

func _on_continue_pressed(): # Volver al menú
	get_tree().change_scene("res://scenes/screens/menu.tscn")
