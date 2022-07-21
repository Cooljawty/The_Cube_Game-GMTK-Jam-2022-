extends KinematicBody2D

var dir = Vector2.ZERO

var helth = 42.0

export var Hit_sounds = [preload("res://Gun/Shoot 2.wav"), preload("res://Gun/Shoot 2.wav"), preload("res://Gun/Shoot 2.wav"), preload("res://Gun/Shoot 2.wav"), preload("res://Gun/Shoot 2.wav"), preload("res://Gun/Shoot 2.wav")]
var BullLocate = preload("res://Enemies/Enemy bullet.tscn")

var Last_damage_type = 0
var Last_damage = 0
var Last_damage_type_2 = 0
var Last_damage_2 = 0
var Last_spliter = 0
var Last_major_damage


var Current_combo = [10, 10]

var last_position = position

func _ready():
	$AnimationPlayer.play("Pirate_Forward_Walk")
	
func _process(delta):
	#look_at(get_node("/root/Global").Player.global_position)
	if global_position.distance_to(get_node("/root/Global").Player.global_position) > 128:
		dir.y = sin(get_angle_to(get_node("/root/Global").Player.global_position)) * 1.2
		dir.x = cos(get_angle_to(get_node("/root/Global").Player.global_position)) * 1.2
	move_and_collide(dir)
	

func Damage_received(Damage, Gun_type):

	helth -= Damage
	get_child(0).pitch_scale = rand_range(0.8, 1.2)
	get_child(0).volume_db = rand_range(0.8, 1.2)
	get_child(0).stream = Hit_sounds[Gun_type - 1]
	get_child(0).play(0)
	print("Enemy health:", helth)
	
	Current_combo.append(Gun_type)
	Current_combo.pop_front();
	print(Current_combo)
	if Current_combo == get_node("/root/Global").Combo1:
			print("Combo1 activated")
			helth -= 5
	"""
	if Last_spliter == 0:
		if Last_damage_type == Gun_type or (Last_damage_type == 0 and Last_damage_type_2 != 0):
			Last_damage_data_save(Damage, Gun_type)
		elif Last_damage_type_2 == Gun_type or Last_damage_type_2 == 0:
			Last_damage_data_save_2(Damage, Gun_type)
		else:
			Last_damage_data_save_2(Damage, Gun_type)
	if Last_spliter == 1:
		if Last_damage_type_2 == Gun_type or (Last_damage_type_2 == 0 and not Last_damage_type != 0):
			Last_damage_data_save_2(Damage, Gun_type)
		elif Last_damage_type == Gun_type or Last_damage_type == 0:
			Last_damage_data_save(Damage, Gun_type)
		else:
			Last_damage = 0
			Last_damage_data_save(Damage, Gun_type)
	print(Last_damage_type, "-", Last_damage_type_2)
	print(Last_damage, "-", Last_damage_2)
	"""
	if helth < 0:
		self.queue_free()

"""
func Last_damage_data_save(Damage, Gun_type):
	Last_damage += Damage
	Last_damage_type = Gun_type
	Last_spliter = 0
	if Last_damage > 5.5:
		print("idk")
		if get_node("/root/Global").Combo_komponent_1.has(Last_major_damage) and get_node("/root/Global").Combo_komponent_2.has(Gun_type):
			Last_major_damage = 0
			helth -= 24
			print("cghcgh")
		else:
			Last_major_damage = Last_damage_type
			print("Last major damage", Last_major_damage)
		Last_damage_type = 0
		Last_damage = 0

func Last_damage_data_save_2(Damage, Gun_type):
	Last_damage_2 += Damage
	Last_damage_type_2 = Gun_type
	Last_spliter = 1
	if Last_damage_2 > 5.5:
		print("idk")
		if get_node("/root/Global").Combo_komponent_1.has(Last_major_damage) and get_node("/root/Global").Combo_komponent_2.has(Gun_type):
			Last_major_damage = 0
			helth -= 24
			print("cghcgh")
		else:
			Last_major_damage = Last_damage_type_2
			print("Last major damage", Last_major_damage)
		Last_damage_type_2 = 0
		Last_damage_2 = 0
"""

func _on_Area2D_area_entered(area):
	if area.get_parent().name == "Bullet":
		var bullet = area.get_parent()
		Damage_received(bullet.Damage, bullet.Gun_type)


func Shoot():
	var bullet = BullLocate.instance()
	get_parent().add_child(bullet)
	#get_child(3).pitch_scale = rand_range(-0.2, 0.2)
	bullet.Speed = 1
	bullet.Damage = 1
	bullet.Gun_type = 0
	bullet.rotation = global_position.angle_to(get_node("/root/Global").Player.global_position)
	bullet.global_position = global_position
