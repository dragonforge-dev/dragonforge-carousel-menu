class_name TestTextureButton extends TextureButton

@onready var label: Label = $Label


func _ready() -> void:
	pressed.connect(_on_button_pressed)


func _on_button_pressed() -> void:
	print(label.text)
