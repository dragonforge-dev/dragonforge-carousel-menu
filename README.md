[![Static Badge](https://img.shields.io/badge/Godot%20Engine-4.6.2.stable-blue?style=plastic&logo=godotengine)](https://godotengine.org/)
[![License](https://img.shields.io/github/license/dragonforge-dev/dragonforge-curved-terrain-2d?logo=mit)](https://github.com/dragonforge-dev/dragonforge-curved-terrain-2d/blob/main/LICENSE)
[![GitHub release badge](https://badgen.net/github/release/dragonforge-dev/dragonforge-curved-terrain-2d/latest)](https://github.com/dragonforge-dev/dragonforge-curved-terrain-2d/releases/latest)
[![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/dragonforge-dev/dragonforge-curved-terrain-2d)](https://img.shields.io/github/languages/code-size/dragonforge-dev/dragonforge-curved-terrain-2d)

# Dragonforge Carousel Menu <img src="/addons/dragonforge_carousel_menu/assets/textures/icons/green_carousel_horse.svg" width="32" alt="Carousel Menu Icon"/>
Plugin that adds a **CarouselMenu** node that can be used to create carousel menus.

# Version 1.0
For use with **Godot 4.6.2.stable** and later.

# Installation Instructions
1. Copy the `dragonforge_carousel_menu` folder from the `addons` folder into your project's `addons` folder.

# Usage Instructions
## Add a Carousel Node
1. Add a new node as you would normally. (The **Create New Node** window will appear.)
2. Type `carousel` into the Search box.
<img src="/assets/docs/add_carousel_menu.png" alt="Add Carousel Menu"/>
3. Select **CarouselMenu**.
4. Click the **Create** button.
5. Configure the CarouselMenu Node
<img src="/assets/docs/carousel_menu_inspector.png" alt="Carousel Menu Inspector View"/>

## Add Buttons to the Carousel Menu Node
Add button nodes as children of the **CarouselMenu** node. They will automatically be added to the carousel. You can add any kind of node that inherits from **BaseButton**, including **Button**, **LinkButton**, **TextureButton**, **CheckBox**, **CheckButton**, **ColorPickerButton**, **MenuButton**, **OptionButton**, and any custom nodes you create from any of those types.

# Known Issues
- Currently to see the buttons in the editor you must refresh the screen. The easiest way to do this is save, close and reload the scene it is in.
- Sometimes the carousel can look funny if there are an even number of buttons. Rotating it solves the problem.

# Class Descriptions
## Carousel Menu <img src="/addons/dragonforge_carousel_menu/assets/textures/icons/green_carousel_horse.svg" width="32" alt="Carousel Menu Icon"/>
Creates a configurable oval of rotating button nodes. Buttons are manipulated by the ui_left and ui_right actions. All nodes that inherit from [BaseButton] that are added as children of this node will be automatically included. **NOTE:** Currently to see the buttons in the editor you must refresh the screen. The easiest way to do this is save, close and reload the scene it is in.

### Signals
- `signal selected(button: BaseButton)` Emitted whenever the carousel is rotated.

### Export Variables
- `radius: Vector2` Defines the path which the buttons in carousel travel.
- `center_offset: Vector2 = Vector2.ZERO` This moves the center of the carousel relative to the center of the [CarouselMenu] node.
- `front_scale: float = 1.35` Size multiplier for the front label. Labels on the side will scale between this and the back_scale number.
- `back_scale: float = 0.65` Size multiplier for the front label. Labels on the side will scale between this and the front_scale number.
- `side_alpha: float = 0.55` The amount of transparency labels have based on their distance from the front.
- `animation_speed: float = 0.25` The amount of time in seconds it takes for the animation to complete (if not interrupted).

### Public Variables
- `selected_button: BaseButton` The currently selected button (the one up front) that will be clicked if the user presses ui_accept.

#Credit
This plugin was inspired by this video. It describes how to make a carousel menu. Someone came to the Godot forum asking how to do this, and I decided to watch the video for fun. This plugin simplified the code and made it a single **Node**.
- [Carousel Menus in Godot](https://www.youtube.com/watch?v=6u8sjztWuVg)
