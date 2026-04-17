extends Node

@onready var first_time = true

func credits():
    get_tree().change_scene_to_file("res://scenes/credits.tscn")
