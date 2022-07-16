extends KinematicBody2D

var vel = Vector2(1,0)
export var Speed = 300
export var Damage = 300

func _ready():
	add_to_group("bullets")
	#print("Bullet: Ready")

func _physics_process(delta):
	self.global_position.y += sin(rotation) * Speed
	self.global_position.x += cos(rotation) * Speed



func _on_Timer_timeout():
	self.queue_free()

