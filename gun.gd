extends KinematicBody2D

var BullLocate = preload("res://bullet.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var debounce = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	look_at(get_global_mouse_position())
	
	var bullet = BullLocate.instance()
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	var bullet = BullLocate.instance()
	get_parent().add_child(bullet)
	bullet.position = $Position2D.position
	bullet.rotation_degrees = rotation_degrees
	print("bang")
