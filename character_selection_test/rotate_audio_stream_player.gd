extends AudioStreamPlayer

@export var spin_right_sound: AudioStream
@export var spin_left_sound: AudioStream
@export var select_sound: AudioStream


func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_right"):
		stream = spin_right_sound
		play()
	if Input.is_action_just_pressed("ui_left"):
		stream = spin_left_sound
		play()
	if event.is_action_pressed("ui_accept"):
		stream = select_sound
		play()
