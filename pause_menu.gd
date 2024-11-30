extends ColorRect

@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var play_button: Button = get_node("CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Resume")
@onready var quit_button: Button = get_node("CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Quit")

func _ready() -> void:
	play_button.pressed.connect(game_unpaused)	
	quit_button.pressed.connect(get_tree().quit)


func game_paused():
	animation.play("Open")
	get_tree().paused = true
	
func game_unpaused():
	animation.play("Close")
	get_tree().paused = false	
		
