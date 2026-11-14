extends Area2D

@export var bounce_kraft: float = -700.0

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		get_tree().change_scene_to_file("res://death_screen.tscn")
		Global.game_state = "dead"
		print(Global.game_state)
