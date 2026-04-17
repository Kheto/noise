extends Label

@onready var update_animation := $UpdateAnimation

@onready var stress:int = Dialogic.VAR.stress
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    var new_stress = int(Dialogic.VAR.stress)
    if stress != new_stress:
        update_animation.play("flash")
    stress = new_stress
    text = "Stress: " + str(stress)
