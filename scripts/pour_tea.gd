extends Node2D

@onready var tea_full = false

func _on_mug_tea_full():
    tea_full = true


func _on_kettle_kettle_placed_back_down():
    if tea_full:
        get_tree().change_scene_to_file("res://scenes/livingroom.tscn")
