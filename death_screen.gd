extends Node2D
@onready var level: RichTextLabel = $Level
@onready var timer: RichTextLabel = $Timer

var time


func _process(delta: float) -> void: # runs EVERY FRAME
	pass


func _on_respawn_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")


func _on_quitdeath_pressed() -> void:
	get_tree().quit()
