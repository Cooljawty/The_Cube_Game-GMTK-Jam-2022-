extends KinematicBody2D

var dir = Vector2.ZERO
export var health = 24.0

var Current_combo = [10, 10]

func _process(delta):
	look_at(get_node("/root/Global").Player.global_position)
	dir.y += sin(rotation) * 0.01
	dir.x += cos(rotation) * 0.01
	move_and_collide(dir)

func Damage_received(Damage, Gun_type):
	health -= Damage
	
	Current_combo.append(Gun_type)
	Current_combo.pop_front();
	print(Current_combo)
	if Current_combo == get_node("/root/Global").Combo1:
		print("Combo1 activated")
		health -= 5
	
	"""
	if Last_spliter == 0:
		if Last_damage_type == Gun_type or (Last_damage_type == 0 and not Last_damage_type_2 != 0):
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
	"""
	if health < 0:
		self.queue_free()

func _on_Area2D_area_entered(area):
	if area.get_parent().name == "Bullet":
		var bullet = area.get_parent()
		Damage_received(bullet.Damage, bullet.Gun_type)
