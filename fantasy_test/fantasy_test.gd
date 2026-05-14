extends Control

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var carousel_menu: CarouselMenu = $CarouselMenu

func _ready() -> void:
	carousel_menu.hide()
	await animated_sprite_2d.animation_finished
	carousel_menu.show()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		await get_tree().create_timer(0.3).timeout
		carousel_menu.hide()
		await get_tree().create_timer(2.0).timeout
		animated_sprite_2d.play("default")
		await animated_sprite_2d.animation_finished
		carousel_menu.show()
