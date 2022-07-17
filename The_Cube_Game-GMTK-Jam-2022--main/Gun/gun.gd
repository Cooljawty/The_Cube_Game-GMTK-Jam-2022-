extends KinematicBody2D

onready var node = $Node2D

var BullLocate = preload("res://Gun/bullet.tscn")
onready var image = $Sprite.texture
export var Guns = [preload("res://Gun/bullet.tscn"), preload("res://Gun/bullet.tscn"), preload("res://Gun/bullet.tscn"), preload("res://Gun/bullet.tscn"), preload("res://Gun/bullet.tscn"), preload("res://Gun/bullet.tscn")]
export var Shot_sound = preload("res://Gun/Shoot 2.wav")
export var Shotgun_sound = preload("res://Gun/Shoot 2.wav")


onready var Player = get_parent()

var Can_gun_shoot = true
var Multi_shot = 1
var Shot = 0
var Masshingun_phase = false

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
		
		Can_gun_shoot = false
		
		if Player.Face == 1:
			shoot(0, 3.5 , 6, 1, 0)
			get_child(1).wait_time = 0.6 * Shooting_speed
		
		elif  Player.Face == 2:
			shoot(0, 3.7 , 3, 2, 5)
			shoot(0, 3.7 , 3, 2, -5)
			Shot = 2
			Multi_shot = 2
			get_child(2).start()
			get_child(1).wait_time = 0.6 * Shooting_speed
		#Burst
		elif  Player.Face == 3:
			Multi_shot = 3
			get_child(1).wait_time = 0.6 * Shooting_speed
			Shot = 3
			get_child(2).start()
			shoot(0, 4.2, 0.4, 3, 0)
		
		elif  Player.Face == 4:
			shoot(-2, 4 , 1.5, 4, 5)
			shoot(2, 4 , 1.5, 4, -5)
			get_child(1).wait_time = 0.3 * Shooting_speed
		
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
				shoot(n * 3 - 6, Shot_speed, 1.2, 5, 0)
		#Mashinegun
		elif  Player.Face == 6:
			get_child(1).wait_time = 0.1 * Shooting_speed
			if Masshingun_phase:
				shoot(0, 4, 1, 6, -10)
				Masshingun_phase = false
			else:
				shoot(0, 4, 1, 6, 10)
				Masshingun_phase = true
		#Cooldown
		get_child(1).start()

	
func _input(event):
	get_child(0).texture = Guns[Player.Face - 1]

func shoot(Rotmodif, Speed, Damage, Gun_type, Offset):
	var bullet = BullLocate.instance()
	Player.get_parent().add_child(bullet)
	get_child(3).pitch_scale = rand_range(0.8, 1.2)
	if [5,1].has(Gun_type):
		get_child(3).stream = Shotgun_sound
	else:
		get_child(3).stream = Shot_sound
	get_child(3).play(0)
	bullet.Speed = Speed
	bullet.Damage = Damage
	bullet.Gun_type = Gun_type
	bullet.rotation_degrees = $Node2D.rotation_degrees + Rotmodif
	bullet.Original_rotation = deg2rad($Node2D.rotation_degrees + Rotmodif)
	bullet.global_position = $Node2D/Position2D.global_position
	bullet.global_position.y += sin($Node2D.rotation + (PI/ 2)) * Offset 
	bullet.global_position.x += cos($Node2D.rotation + (PI/ 2)) * Offset 
	


func Gun_can_shoot():
	Can_gun_shoot = true

func _on_multy_shot_timeout():
	Multi_shot -= 1
	if Multi_shot > 1:
		get_child(2).start()
	if Shot == 3:
		shoot(0, 4.2, 0.4, 3, 0)
	else:
		shoot(0, 3.7 , 3, 2, 5)
