extends Node

var game_state = 'start'
@onready var sprite = get_node_or_null("/root/Main/Player")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if game_state == 'dead':
		get_tree().change_scene_to_file("res://death_screen.tscn")
	var player = get_tree().get_first_node_in_group("player")
	if player != null:
		print(player.position)

	pass
