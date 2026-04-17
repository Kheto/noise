extends Area2D

@onready var tea = 0
@onready var full:= $Full/Top
@onready var toolTip := $Tooltip

signal tea_full
# Called when the node enters the scene tree for the first time.
func _ready():
    full.disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    if tea >= 50:
        full.disabled = false
        toolTip.text = "Mug, contains:\nhot tea"
        tea_full.emit()


func _on_body_entered(body):
    tea += 1
    if body is WaterChunk:
        body.consume()
