extends Control


var scene_lvlselect = load("res://scenes/screens/level_select.tscn")

onready var Collectibles = get_node("Datos/Collectibles")
onready var Tiempo = get_node("Datos/Tiempo")
onready var Puntaje = get_node("Datos/Puntaje")

# Mostrar las estadísticas del nivel
func _ready():
	Tiempo.text = ("Tiempo: " + str(Globals.level_time))
	Puntaje.text = ("Puntaje: " + str(Globals.level_score))
	Collectibles.text = (str(Globals.last_collectibles))


# Botón para ir al level select
func _on_lvlselector_pressed(): 
	get_tree().change_scene_to(scene_lvlselect)

# Botón de reintentar el nivel
func _on_Retry_pressed():
	get_tree().change_scene(Globals.levels[Globals.current_level])

# Ir al siguiente nivel
func _on_Next_level_pressed():
	var next_scene = ""
	Globals.current_level += 1 # Sumar uno al array de niveles en Globals

	if Globals.current_level >= Globals.levels.size(): #Si es el último nivel de la lista, lleva al ending
		next_scene = "res://scenes/screens/game_end.tscn"

	else: # Ir al nivel siguiente
		next_scene = Globals.levels[Globals.current_level]
	get_tree().change_scene(next_scene)
