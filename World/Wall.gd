extends Sprite

export var Miss_sounds = [preload("res://Gun/Shoot 2.wav"), preload("res://Gun/Shoot 2.wav"), preload("res://Gun/Shoot 2.wav"), preload("res://Gun/Shoot 2.wav"), preload("res://Gun/Shoot 2.wav"), preload("res://Gun/Shoot 2.wav")]


func Damage_received(Damage, Gun_type):
	get_child(0).pitch_scale = rand_range(0.8, 1.2)
	get_child(0).volume_db = rand_range(0.5, 1)
	get_child(0).stream = Miss_sounds[Gun_type - 1]
	get_child(0).play()
