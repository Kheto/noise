extends Label
class_name Tooltip

@onready var display_area := $".."

func _ready():
    display_area.mouse_entered.connect(show)
    display_area.mouse_exited.connect(hide)

func _process(_delta):
    if text == "":
        visible = false
    global_position = get_global_mouse_position()
    position.y -= size.y
