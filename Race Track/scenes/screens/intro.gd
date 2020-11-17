extends Node2D

func _on_AnimationPlayer_animation_finished(maurasio_intro):
	get_tree().change_scene("res://scenes/screens/menu.tscn")
