extends KinematicBody2D

onready var node = $Node2D

var BullLocate = preload("res://Gun/bullet.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var debounce = 0
# Called when the node enters the scene tree for the first time.
export var bullet_speed = 100
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	look_at(get_global_mouse_position())
	node.rotation_degrees = rotation_degrees
	var bullet = BullLocate.instance()
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	var bullet = BullLocate.instance()
	get_parent().get_parent().add_child(bullet)
	bullet.rotation_degrees = $Node2D.rotation_degrees
	bullet.global_position = $Node2D/Position2D.global_position
	
	print("bang")
