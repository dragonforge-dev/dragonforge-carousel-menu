extends AudioStreamPlayer

const LIGHT_CLICK_A = preload("uid://dyxhuj7rh7hsh")
const LIGHT_CLICK_B = preload("uid://s1vgeh23l6ir")
const LIGHT_START = preload("uid://deltni45b8l0q")


func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_right"):
		stream = LIGHT_CLICK_A
		play()
	if Input.is_action_just_pressed("ui_left"):
		stream = LIGHT_CLICK_B
		play()
	if event.is_action_pressed("ui_accept"):
		stream = LIGHT_START
		play()
