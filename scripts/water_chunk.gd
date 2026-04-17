extends RigidBody2D
class_name WaterChunk

func _ready():
    pass
    
func _process(delta):
    position.y += 120.0*delta
    if position.y > 250:
        queue_free()

func consume():
    queue_free()
