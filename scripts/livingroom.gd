extends Node2D

func _on_move_to_kitchen_pressed():
    get_tree().change_scene_to_file("res://scenes/pour_tea.tscn")

func _ready():
    if Globals.first_time:
        #Dialogic.VAR.stress = 6
        Globals.first_time = false
        Dialogic.start("game_intro")
    else:
        Dialogic.VAR.stress -= 2;
        if Dialogic.current_timeline == null:
            Dialogic.start("day_intro")
