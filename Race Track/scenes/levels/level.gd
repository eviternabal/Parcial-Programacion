extends Node

var level_time = 0 # Guarda el tiempo que tomó completar el nivel.
var score = 0 # Guarda el puntaje alcanzado en el nivel.

var collectibles = 0 #Guarda la cantidad de collectibles recogidos en el nivel.

var car_model = car # Modelo del vehículo que se cargará.
var car = "" # recibe qué vehículo corresponde según el modo de juego.

# MODO DIFÍCIL ACTIVADO? #
func check_saoj(): # checkea si el modo saoj está activado, y asigna un vehículo en consecuencia.
	if Globals.SAOj_mode == true:
		car = load("res://scenes/car/fitito.tscn") # Vehículo especial para saoj
	else:
		car = load("res://scenes/car/car.tscn") # Vehículo normal

# SPAWNING #
func spawn(): # Carga una instancia de vehículo sobre el nodo spawner (pos2d)
	$spawner.add_child(car.instance())


func _ready():
	check_saoj()
	spawn()
	level_time = 0
# Conectar señales de los goals
	var goals = get_tree().get_nodes_in_group("goals")
	for goal in goals:
		goal.connect("level_won", self, "_on_goal_reached")
# Conectar señales de los timers
	var timers = get_tree().get_nodes_in_group("timers")
	for timer in timers:
		timer.connect("timeout", self, "_on_timer_timeout")
# Conectar señales de los pickups
	var total_collectibles = get_tree().get_nodes_in_group("pickups") # Array con todos los collectibles del nivel
	for collectible in total_collectibles:
		collectible.connect ("pickup_pickuped", self, "on_pickup_pickuped")
	$level_song.play()
	$UI/collectibles_text.text = ("Collectibles: " + str(collectibles) + "/" + str(total_collectibles.size())) 


func _on_goal_reached(): # Al llegar a la meta...
	score = collectibles*100 - level_time*50 # Calcula el score total con la fórmula C*100 - T*50
	Globals.level_time = level_time 
	if score > 0:
# Checkea a qué level corresponde el score y acualiza su variable en Globals
		if Globals.current_level == 0:
			Globals.level_1_last_score = score
			Globals.level_score = score
		if Globals.current_level == 1:
			Globals.level_2_last_score = score
			Globals.level_score = score
		if Globals.current_level == 2:
			Globals.level_3_last_score = score
			Globals.level_score = score

	else: # Impide que el score sea negativo, ajustándolo a 0 si no es > 0, luego actualiza la variable en Globals.
		score = 0
		if Globals.current_level == 0:
			Globals.level_1_last_score = score
			Globals.level_score = score
		if Globals.current_level == 1:
			Globals.level_2_last_score = score
			Globals.level_score = score
		if Globals.current_level == 2:
			Globals.level_3_last_score = score
			Globals.level_score = score

	Globals.new_high_score() # Activa la función para calcular el nuevo high score
	get_tree().change_scene("res://scenes/screens/LevelClear.tscn") # Cambia la escena a la trancisión de nivel

	Globals.last_collectibles = str($UI/collectibles_text.text) # Envía los collectibles recogidos a Globals

# TIMER #
func _on_timer_timeout(): # Un nodo timer envía timeout cada 1 segundo.
	level_time += 1 # Por cada timeout, se suma 1 al tiempo.
	$UI/time_text.set_text("Time: " + str(level_time)) # Actualizar UI

# RECOGER COLLECTIBLES #
func on_pickup_pickuped():
	var total_collectibles = get_tree().get_nodes_in_group("pickups") # Array con todos los collectibles del nivel
	collectibles += 1
	$pickup_pickuped_sound.play()
	$UI/collectibles_text.text = ("Collectibles: " + str(collectibles) + "/" + str(total_collectibles.size())) # Lee el tamaño del array para saber cuántos collectibles hay en el nivel

# MUERTE Y RESPAWN #
func _on_deathwall_body_entered(body): # Recarga la escena al caerse del mapa
	get_tree().reload_current_scene()

func _input(event):
	restart()
	
func restart():
	if Input.is_action_pressed("reload_scene"):
		print("reloaded")
		get_tree().reload_current_scene()

