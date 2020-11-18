extends Node2D

# El menu principal y el level selector comparten script.

# Rutas de escenas
var scene_mainmenu = load("res://scenes/screens/menu.tscn") 
var scene_lvlselect = load("res://scenes/screens/level_select.tscn") 
var scene_credits = load("res://scenes/screens/credits.tscn") 

var scene_lvl1 = load("res://scenes/levels/Level 1.tscn") 
var scene_lvl2 = load("res://scenes/levels/Level 2.tscn") 
var scene_lvl3 = load("res://scenes/levels/Level 3.tscn")

# High scores
onready var lvl_1_score = get_node("max score labels/lvl 1")
onready var lvl_2_score = get_node("max score labels/lvl 2")
onready var lvl_3_score = get_node("max score labels/lvl 3")
var level_1_high_score = Globals.level_1_high_score
var level_2_high_score = Globals.level_2_high_score
var level_3_high_score = Globals.level_3_high_score

func _ready():
	if get_tree().current_scene.name == "level_select": # Si la escena es el level selector, mostrar high scores en un label
		lvl_1_score.text = ("Max score: " + str(level_1_high_score))
		lvl_2_score.text = ("Max score: " + str(level_2_high_score))
		lvl_3_score.text = ("Max score: " + str(level_3_high_score))

		# Activar y hacer visible el botón para alternar modo difícil
		if Globals.SAOj_toggleable == true:
			$SaojMode.disabled = false
			$SaojMode.visible = true

func _on_SaojMode_toggled(button_pressed): # Activar modo difícil al presionar botón
	Globals.SAOj_mode = true


func _on_lvlselector_pressed(): # Ir al level selector
	get_tree().change_scene_to(scene_lvlselect)

func _on_credits_pressed(): # Ir a créditos
	get_tree().change_scene_to(scene_credits)

func _on_quit_pressed(): # Salir del jueego
	get_tree().quit()

func _go_to_menu(): # Ir al menú principal
	get_tree().change_scene_to(scene_mainmenu)

func _on_lvl_pressed(): # Ir al nivel correspondiente
	if $"lvl 1".pressed:
		Globals.current_level = 0
		get_tree().change_scene_to(scene_lvl1)
	if $"lvl 2".pressed:
		Globals.current_level = 1
		get_tree().change_scene_to(scene_lvl2)
	if $"lvl 3".pressed:
		Globals.current_level = 2
		get_tree().change_scene_to(scene_lvl3)
