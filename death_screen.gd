extends Node2D
@onready var level: RichTextLabel = $Level
@onready var timer: RichTextLabel = $Timer

var time

func _ready() -> void:
	await Timer(5.0) # using the function created
	
	if Global.minigames_done < 3: # if you havent completed 3 minigames yet 
		Global.minigames_done = Global.minigames_done +1
		get_tree().change_scene_to_file("res://scenes/minigame_" + str(Global.minigames_done) + ".tscn") # changes your scene by arranging this frankenstein path. 
# Above, your script is being told to go to the next minigame. If the 
# current minigame is Level 1, then you would be on minigame 1. If you 
# complete that level, you have the minigames_done add one, and then you 
# look for the scene titled `minigame_` and then whatever minigame number 
# should be next. Make sure you name your minigame saves appropriately.

	else:
		get_tree().change_scene_to_file("res://scenes/title_screen.tscn") # changes your scene
	

func _process(delta: float) -> void: # runs EVERY FRAME
	pass
#these values, cool hack. by the way this is a horrid way to illustrate the 
#lives visually so later you can always find alternative code. Now, dw abt it.

func _on_respawn_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")


func _on_quitdeath_pressed() -> void:
	get_tree().quit()
