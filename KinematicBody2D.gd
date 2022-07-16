extends KinematicBody2D
onready var node = $Node2D
var BullLocate = preload("res://bullet.tscn")
# Declare member variables here.
var debounce = 0

# Called when the node enters the scene tree for the first time.
export var bullet_speed = 100
func _ready():
	print("Gun: Ready")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())
	node.rotation_degrees = rotation_degrees
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	func shoot(bullet):
	$Node2D/Position2D.add_child(bullet)
	bullet.rotation_degrees = 0.0
	bullet.position = Vector2(0.0,0.0)

	print("bang")
