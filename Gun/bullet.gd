extends KinematicBody2D

var vel = Vector2(1,0)
var speed = 300

func _ready():
	add_to_group("bullets")
	#print("Bullet: Ready")

func _physics_process(delta):
	self.global_position.y += sin(rotation) * 2.7
	self.global_position.x += cos(rotation) * 2.7


func _on_Timer_timeout():
	self.queue_free()

