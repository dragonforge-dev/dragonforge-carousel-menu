extends AnimatedSprite2D


func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_right"):
		play("turn_pages_left")
	if Input.is_action_just_pressed("ui_left"):
		play("turn_pages_right")
	if event.is_action_pressed("ui_accept"):
		play("close_book")
