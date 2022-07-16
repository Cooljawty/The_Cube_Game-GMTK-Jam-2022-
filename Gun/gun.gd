extends KinematicBody2D

onready var node = $Node2D

var BullLocate = preload("res://Gun/bullet.tscn")

export var Guns = [preload("res://Gun/bullet.tscn"), preload("res://Gun/bullet.tscn"), preload("res://Gun/bullet.tscn"), preload("res://Gun/bullet.tscn"), preload("res://Gun/bullet.tscn"), preload("res://Gun/bullet.tscn")]

onready var Player = get_parent()

var Can_gun_shoot = true
var Multi_shot = 1

var Damage = 1
var Shooting_speed = 1
var Pierce = 0
var Bounce = 0
var Bullet_speed

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
	if Multi_shot < 2:
		look_at(get_global_mouse_position())
	node.rotation_degrees = rotation_degrees
	if Input.is_action_pressed("shoot") and Can_gun_shoot:
		print(Player.Face)
		Can_gun_shoot = false
		
		if Player.Face == 1:
			shoot(0, 3.5 ,6)
			get_child(1).wait_time = 0.6 * Shooting_speed
		
		elif  Player.Face == 2:
			pass
		#Burst
		elif  Player.Face == 3:
			Multi_shot = 3
			get_child(1).wait_time = 0.6 * Shooting_speed
			get_child(2).start()
			shoot(0, 4.2, 0.4)
		
		elif  Player.Face == 4:
			pass
		#Shotgun
		elif  Player.Face == 5:
			get_child(1).wait_time = 0.6 * Shooting_speed
			var Shot_speed = 1.1
			for n in 5:
				if [1,3].has(n):
					Shot_speed = 4.2
				elif n == 2:
					Shot_speed = 4
				else:
					Shot_speed = 3.8
				shoot(n * 3 - 6, Shot_speed, 1.2)
		#Mashinegun
		elif  Player.Face == 6:
			get_child(1).wait_time = 0.1 * Shooting_speed
			shoot(0, 4, 1)
		#Cooldown
		get_child(1).start()

func _input(event):
	get_child(0).texture = Guns[Player.Face - 1]

func shoot(Rotmodif, Speed, Damage):
	var bullet = BullLocate.instance()
	Player.get_parent().add_child(bullet)
	bullet.Speed = Speed
	bullet.Damage = Damage
	bullet.rotation_degrees = $Node2D.rotation_degrees + Rotmodif
	bullet.global_position = $Node2D/Position2D.global_position
	


func Gun_can_shoot():
	Can_gun_shoot = true


func _on_multy_shot_timeout():
	Multi_shot -= 1
	if Multi_shot > 1:
		get_child(2).start()
	shoot(0, 4.2, 0.4)