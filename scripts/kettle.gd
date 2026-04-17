extends TextureRect
class_name Kettle

enum {POURING, HELD, BOILED, BOILING, WAITING}

var state = WAITING

@onready var origin := position
@onready var spout:= $Spout
@onready var water_proto := preload("res://scenes/water_chunk.tscn")
@onready var pour_timer := $PourTimer
@onready var base_button:TextureButton = $BaseButton
@onready var base_button_origin := base_button.global_position
@onready var boil_sound := $BoilSound
@onready var click_on := $ClickOn
@onready var click_off := $ClickOff
@onready var switch_on := $SwitchOn
@onready var switch_off := $SwitchOff
@onready var tooltip := $BaseButton/Tooltip

signal kettle_placed_back_down

func _ready():
    pivot_offset = size*Vector2(0.5,0.5)

func _process(_delta):
    base_button.global_position = base_button_origin
    if state == HELD or state == POURING:
        position = get_global_mouse_position() - (size*Vector2(0.5,0.5))
        
    if state == HELD and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
        state = POURING
        
    if state == POURING and not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
        state = HELD
        
    if state == POURING:
        rotation = -45.0
        pour_water()

    else:
        rotation = 0
    
func pour_water():
    if pour_timer.is_stopped():
        var drop = water_proto.instantiate()
        drop.position = spout.global_position
        get_parent().add_child(drop)
        pour_timer.start()

func pick_up():
    state = HELD
    tooltip.text = ""

func start_boiling():
    state = BOILING
    if OS.is_debug_build():
        boil_sound.stream = load("res://sounds/click_off.ogg")
    boil_sound.play()
    click_on.play()
    switch_on.visible = true
    switch_off.visible = false
    
func put_down():
    position = origin
    state = BOILED
    kettle_placed_back_down.emit()

func _on_base_button_pressed():
    if state == WAITING:
        start_boiling()
    elif state == BOILED:
        pick_up()
    elif state == HELD or state == POURING:
        put_down()


func _on_boil_sound_finished():
    state = BOILED
    click_off.play()
    tooltip.text = "Kettle, contains:\nboiling hot\nwater"
    switch_on.visible = false
    switch_off.visible = true
