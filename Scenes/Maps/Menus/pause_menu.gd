extends ColorRect

@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var play_button: Button = get_node("CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Resume")
@onready var quit_button: Button = get_node("CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Quit")

func _ready() -> void:
	play_button.pressed.connect(game_unpaused)	
	quit_button.pressed.connect(get_tree().quit)


func game_paused():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	animation.play("Open")
	get_tree().paused = true
	
func game_unpaused():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	animation.play("Close")
	get_tree().paused = false	


func _input(event):
	if event.is_action_pressed("Esc"):
		
		game_paused()
	if get_tree().paused == false:
		hide()
	if get_tree().paused == true:
		show()
