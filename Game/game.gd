extends Node3D

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Esc"):
		$PauseMenu.game_paused()
	if get_tree().paused == false:
		$PauseMenu.hide()
	if get_tree().paused == true:
		$PauseMenu.show()

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
