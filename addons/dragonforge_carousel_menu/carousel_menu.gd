@tool
@icon("uid://dcw0mrtnfh3wc")
## Creates a configurable oval of rotating button nodes. Buttons are manipulated
## by the ui_left and ui_right actions. All nodes that inherit from [BaseButton]
## that are added as children of this node will be automatically included.
## NOTE: Currently to see the buttons in the editor you must refresh the
## screen. The easiest way to do this is save, close and reload the scene it is
## in.
class_name CarouselMenu extends Control

## Emitted whenever the carousel rotates and a new button is selected
signal selected(button: BaseButton)

## Defines the path which the buttons in carousel travel.
@export var radius: Vector2 = Vector2(420.0, 120.0)
## This moves the center of the carousel relative to the center of the
## [CarouselMenu] node.
@export var center_offset: Vector2 = Vector2.ZERO
## Size multiplier for the front label. Labels on the side will scale between
## this and the back_scale number.
@export var front_scale: float = 1.35
## Size multiplier for the front label. Labels on the side will scale between
## this and the front_scale number.
@export var back_scale: float = 0.65
## The amount of transparency labels have based on their distance from the
## front.
@export var side_alpha: float = 0.55
## The amount of time in seconds it takes for the animation to complete (if not interrupted).
@export var animation_speed: float = 0.25

## The currently selected button (the one up front) that will be clicked if
## the user presses ui_accept.
var selected_button: BaseButton
var _selected_index: int = 0
var _active_tween: Tween


func _ready() -> void:
	for button in get_children():
		button.pivot_offset = button.size * 0.5
		button.focus_mode = Control.FOCUS_NONE
	
	selected_button = get_children()[0]
	selected.emit(selected_button)
	_update_carousel(false)
	
	if Engine.is_editor_hint():
		set_process_unhandled_input(false)


func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_right"):
		_move_selection(1)
	if Input.is_action_just_pressed("ui_left"):
		_move_selection(-1)
	if event.is_action_pressed("ui_accept"):
		selected_button.pressed.emit()


func _move_selection(direction: int) -> void:
	_selected_index = wrapi(_selected_index + direction, 0, get_child_count())
	selected_button = get_children()[_selected_index]
	selected.emit(selected_button)
	_update_carousel(true)


func _update_carousel(animated: bool) -> void:
	if _active_tween:
		_active_tween.kill()
		_active_tween = null
	
	var center := size * 0.5 + center_offset
	
	for button in get_children():
		var angle := _get_angle(button)
		var depth := cos(angle)
		var depth_normalized := inverse_lerp(-1.0, 1.0, depth)

		var target_position := Vector2(sin(angle) * radius.x, -depth * radius.y)
		target_position = center + target_position - button.size * 0.5
		var target_scale: Vector2 = Vector2.ONE * lerp(back_scale, front_scale, depth_normalized)
		var target_rotation := deg_to_rad(-sin(angle) * 8.0)
		var alpha_value := lerp(side_alpha, 1.0, depth_normalized)
		
		button.z_index = int(depth_normalized * 100.0)
		button.disabled = button != selected_button
		
		if animated:
			_active_tween = create_tween()
			_active_tween.set_parallel(true)
			_active_tween.tween_property(button, "position", target_position, animation_speed)\
				.set_trans(Tween.TRANS_CUBIC)\
				.set_ease(Tween.EASE_OUT)
			_active_tween.tween_property(button, "scale", target_scale, animation_speed)\
				.set_trans(Tween.TRANS_CUBIC)\
				.set_ease(Tween.EASE_OUT)
			_active_tween.tween_property(button, "rotation", target_rotation, animation_speed)\
				.set_trans(Tween.TRANS_CUBIC)\
				.set_ease(Tween.EASE_OUT)
			_active_tween.tween_property(button, "modulate:a", alpha_value, animation_speed)
		else:
			button.position = target_position
			button.scale = target_scale
			button.rotation = target_rotation
			button.modulate.a = alpha_value


# Returns an angle in radians based on the position of the passed control
# in the list of controls.
func _get_angle(button: Control) -> float:
	var offset: int = get_children().find(button) - get_children().find(selected_button)
	var size = get_child_count()
	offset = wrapi(offset, -size / 2, size / 2 + 1)
	return offset * TAU / float(get_child_count())
