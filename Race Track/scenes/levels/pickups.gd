extends Node

var score = 0
var collectibles = 0

func _ready():
	var pickups = get_tree().get_nodes_in_group("pickups")
	for pickup in pickups:
		pickup.connect ("pickup_pickuped", self, "on_pickup_pickuped")
	pass 

func on_pickup_pickuped():
	score += 20
	collectibles += 1
