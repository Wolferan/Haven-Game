extends Area2D

var benutzt := false

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if benutzt or not body.is_in_group("player"):
		return
	benutzt = true
	get_tree().change_scene_to_file.call_deferred("res://2ndlevel.tscn")
