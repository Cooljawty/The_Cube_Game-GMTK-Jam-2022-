extends Sprite

var helth = 48.0

export var Hit_sounds = [preload("res://Gun/Shoot 2.wav"), preload("res://Gun/Shoot 2.wav"), preload("res://Gun/Shoot 2.wav"), preload("res://Gun/Shoot 2.wav"), preload("res://Gun/Shoot 2.wav"), preload("res://Gun/Shoot 2.wav")]




func Damage_received(Damage, Gun_type):
	helth -= Damage
	get_child(0).pitch_scale = rand_range(0.8, 1.2)
	get_child(0).volume_db = rand_range(0.8, 1.2)
	get_child(0).stream = Hit_sounds[Gun_type - 1]
	get_child(0).play(0)
	
	if helth < 0:
		self.queue_free()


