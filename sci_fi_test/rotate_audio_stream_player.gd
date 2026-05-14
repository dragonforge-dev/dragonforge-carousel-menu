extends AudioStreamPlayer

const UPDATE_FLASHLIGHT_A = preload("uid://bw4gm0gy4sydl")
const UPDATE_FLASHLIGHT_B = preload("uid://rd7o30pq04a0")
const SIGNAL_POSITIVE_JRPG_A = preload("uid://ckekpdo7i243s")


func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_right"):
		stream = UPDATE_FLASHLIGHT_A
		play()
	if Input.is_action_just_pressed("ui_left"):
		stream = UPDATE_FLASHLIGHT_B
		play()
	if event.is_action_pressed("ui_accept"):
		stream = SIGNAL_POSITIVE_JRPG_A
		play()
