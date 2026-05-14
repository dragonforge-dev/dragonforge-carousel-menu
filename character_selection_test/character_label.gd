extends Label

@onready var carousel_menu: CarouselMenu = $"../../CarouselMenu"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	carousel_menu.selected.connect(_on_selected)
	text = carousel_menu.selected_button.name


func _on_selected(button: BaseButton) -> void:
	text = button.name
