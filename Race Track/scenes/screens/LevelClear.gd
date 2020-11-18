extends Control


var scene_lvlselect = load("res://scenes/screens/level_select.tscn")

onready var Tiempo = get_node("Datos/Tiempo")
onready var Puntaje = get_node("Datos/Puntaje")

func _ready():
	Tiempo.text = ("Tiempo: " + str(Globals.level_time))
	Puntaje.text = ("Puntaje: " + str(Globals.level_score))

func _on_lvlselector_pressed():
	get_tree().change_scene_to(scene_lvlselect)

func _on_Retry_pressed():
	get_tree().change_scene(Globals.levels[Globals.current_level])

func _on_Next_level_pressed():
	var next_scene = ""
	Globals.current_level += 1
	print(Globals.current_level)
	if Globals.current_level >= Globals.levels.size():
		next_scene = "res://scenes/screens/credits.tscn"
	else:
		next_scene = Globals.levels[Globals.current_level]
		print(next_scene)
	get_tree().change_scene(next_scene)

