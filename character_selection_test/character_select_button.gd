extends BaseButton

@export var select_sound: AudioStream

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var rotate_audio_stream_player: AudioStreamPlayer = $"../../RotateAudioStreamPlayer"


func _ready() -> void:
	pressed.connect(_on_button_pressed)


func _on_button_pressed() -> void:
	rotate_audio_stream_player.stream = select_sound
	rotate_audio_stream_player.play()
	animated_sprite_2d.play("selected")
	await animated_sprite_2d.animation_finished
	animated_sprite_2d.play("default")
