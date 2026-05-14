extends BaseButton

@export_file_path("*.tscn") var scene_to_load: String

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	pressed.connect(_on_button_pressed)


func _on_button_pressed() -> void:
	audio_stream_player.play()
	await audio_stream_player.finished
	get_tree().change_scene_to_file(scene_to_load)
