extends Node2D

var vel = Vector2(1,0)
export var Speed = 300
export var Damage = 300
export var Gun_type = 300
export var Extra_info = 5
export var Original_rotation = 0.0

signal Deel_damage(Damage, Gun_type)

func _ready():
	add_to_group("bullets")
	#print("Bullet: Ready")

func _physics_process(delta):
	if Gun_type == 2:
		rotation_degrees += Extra_info
		self.global_position.y += sin(rotation) * 3
		self.global_position.x += cos(rotation) * 3
	self.global_position.y += sin(rotation) * Speed 
	self.global_position.x += cos(rotation) * Speed 

func _on_Timer_timeout():
	self.queue_free()


func Area_entered(area):
	return
	if area.get_collision_layer_bit(0):
		connect("Deel_damage", area.get_parent(), "Damage_received")
		emit_signal("Deel_damage", Damage, Gun_type)
		self.queue_free()
