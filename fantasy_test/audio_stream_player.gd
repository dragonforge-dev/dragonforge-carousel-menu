extends AudioStreamPlayer

const FLIP_PAGE_JOURNAL_A = preload("uid://crb7jegj60msw")
const FLIP_PAGE_JOURNAL_B = preload("uid://b5cdprkf80qwb")
const CLOSE_JOURNAL_A = preload("uid://cluu2ua4ecsfb")


func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_right"):
		stream = FLIP_PAGE_JOURNAL_A
		play()
	if Input.is_action_just_pressed("ui_left"):
		stream = FLIP_PAGE_JOURNAL_B
		play()
	if event.is_action_pressed("ui_accept"):
		stream = CLOSE_JOURNAL_A
		play()
