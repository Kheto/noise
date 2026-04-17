extends Control

var initial:float

func _ready():
    initial = position.y
    position.y += size.y
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if position.y >= initial:
        position.y -= delta*30
