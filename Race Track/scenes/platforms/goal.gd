extends StaticBody2D

signal level_won

func _on_Area2D_body_entered(body):
	if body.is_in_group("wheels"):
		emit_signal("level_won")
