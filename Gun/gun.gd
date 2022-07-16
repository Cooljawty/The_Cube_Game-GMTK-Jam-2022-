extends KinematicBody2D

onready var node = $Node2D

var BullLocate = preload("res://Gun/bullet.tscn")

export var Guns = [preload("res://Gun/bullet.tscn"), preload("res://Gun/bullet.tscn"), preload("res://Gun/bullet.tscn"), preload("res://Gun/bullet.tscn"), preload("res://Gun/bullet.tscn"), preload("res://Gun/bullet.tscn"), preload("res://Gun/bullet.tscn")]

onready var Player = get_parent()

var Can_gun_shoot = true
var Multi_shot

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

func _input(event):
	get_child(0).texture = Guns[Player.Face - 1]
	if Input.is_action_just_pressed("shoot") and Can_gun_shoot:
		print("123")
		Can_gun_shoot = false
		get_child(1).start()
		for n in Player.Face:
			shoot(rand_range(-5,5))


func shoot(Rotmodif):
	var bullet = BullLocate.instance()
	Player.get_parent().add_child(bullet)
	bullet.rotation_degrees = $Node2D.rotation_degrees + Rotmodif
	bullet.global_position = $Node2D/Position2D.global_position
	
	print("bang")


func Gun_can_shoot():
	Can_gun_shoot = true
	print("Text")
