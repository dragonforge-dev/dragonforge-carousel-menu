extends PanelContainer

var bounce_range: float = 10.0
var time: float = 1.5
var min_scale = Vector2.ONE * 0.95
var max_scale = Vector2.ONE * 1.05

func _ready() -> void:
	_start_float()

func _start_float() -> void:
	var tween = create_tween()
	tween.set_loops()
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_IN_OUT)

	tween.tween_property(self, "position:y", -bounce_range, time).as_relative()
	tween.parallel().tween_property(self, "scale", min_scale, time)

	tween.tween_property(self, "position:y", bounce_range, time).as_relative()
	tween.parallel().tween_property(self, "scale", max_scale, time)
