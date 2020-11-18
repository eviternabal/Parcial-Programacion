extends Position2D

signal pickup_pickuped

onready var animation = get_node("AnimationPlayer")

func _ready():
	pass 

func _on_Area2D_body_entered(body):
	if body.is_in_group("wheels"):
		emit_signal("pickup_pickuped")
		animation.play("ded")
	pass 
