extends Position2D

signal pickup_pickuped

func _ready():
	pass 

func _on_Area2D_body_entered(body):
	if body.is_in_group("wheels"):
		emit_signal("pickup_pickuped")
	pass 
