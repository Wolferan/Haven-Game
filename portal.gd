extends Area2D

var gewonnen := false

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if gewonnen or not body.is_in_group("player"):
		return
	gewonnen = true
	_zeige_gewonnen.call_deferred()

func _zeige_gewonnen() -> void:
	var layer := CanvasLayer.new()
	layer.process_mode = Node.PROCESS_MODE_ALWAYS   # läuft auch, wenn das Spiel pausiert ist

	# halbdurchsichtiger dunkler Hintergrund
	var hintergrund := ColorRect.new()
	hintergrund.color = Color(0, 0, 0, 0.6)
	hintergrund.set_anchors_preset(Control.PRESET_FULL_RECT)
	layer.add_child(hintergrund)

	var box := VBoxContainer.new()
	box.set_anchors_preset(Control.PRESET_FULL_RECT)
	box.alignment = BoxContainer.ALIGNMENT_CENTER
	layer.add_child(box)

	var text := Label.new()
	text.text = "You Won!"
	text.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	text.add_theme_font_size_override("font_size", 108)
	box.add_child(text)

	var menue := Button.new()
	menue.text = "Back to menu"
	menue.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	menue.pressed.connect(_zurueck_zum_menue)
	box.add_child(menue)

	get_tree().current_scene.add_child(layer)
	get_tree().paused = true   # Spiel anhalten

func _zurueck_zum_menue() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://title_scene.tscn")
