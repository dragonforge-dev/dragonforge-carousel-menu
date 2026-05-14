extends BaseButton

@onready var rotate_audio_stream_player: AudioStreamPlayer = $"../../RotateAudioStreamPlayer"


func _ready() -> void:
	pressed.connect(_on_button_pressed)


func _on_button_pressed() -> void:
	await rotate_audio_stream_player.finished
	get_tree().unload_current_scene()
