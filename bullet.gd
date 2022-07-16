extends KinematicBody2D

var vel = Vector2(1,0)
var speed = 300

func _ready():
	add_to_group("bullets")
	#print("Bullet: Ready")

func _physics_process(delta):
	var collision_info =  move_and_collide(vel.normalized() * delta * speed)
	#print("Bullet: Moving")
	pass
