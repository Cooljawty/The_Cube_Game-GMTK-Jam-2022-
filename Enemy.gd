extends KinematicBody2D

var dir = Vector2.ZERO
var helth = 24.0

var Last_damage_type = 0
var Last_damage = 0
var Last_damage_type_2 = 0
var Last_damage_2 = 0
var Last_spliter = 0
var Last_major_damage


func _process(delta):
	look_at(get_node("/root/Global").Player.global_position)
	dir.y += sin(rotation) * 0.01
	dir.x += cos(rotation) * 0.01
	move_and_collide(dir)

func Damage_received(Damage, Gun_type):
	helth -= Damage
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
	if helth < 0:
		self.queue_free()

func Last_damage_data_save(Damage, Gun_type):
	Last_damage += Damage
	Last_damage_type = Gun_type
	Last_spliter = 0
	if Last_damage > 5.5:
		if get_node("/root/Global").Combo_komponent_1.has(Last_major_damage) and get_node("/root/Global").Combo_komponent_2.has(Gun_type):
			Last_major_damage = 0
			helth -= 12
			print("cghcgh")
		else:
			Last_major_damage = Last_damage_type
		Last_damage_type = 0
		Last_damage = 0

func Last_damage_data_save_2(Damage, Gun_type):
	Last_damage_2 += Damage
	Last_damage_type_2 = Gun_type
	Last_spliter = 1
	if Last_damage > 5.5:
		if get_node("/root/Global").Combo_komponent_1.has(Last_major_damage) and get_node("/root/Global").Combo_komponent_2.has(Gun_type):
			Last_major_damage = 0
			helth -= 12
		else:
			Last_major_damage = Last_damage_type_2
		Last_damage_type_2 = 0
		Last_damage_2 = 0
