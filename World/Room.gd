extends Sprite

var Enemy = preload("res://Enemy.tscn")
var Box = preload("res://World/Box.tscn")
onready var World_ = get_parent()

func _ready():
	randomize()
	print(World_)
	for n in int(rand_range(5, 7)):
		if randi() % 3 == 1:
			var Spawn = Enemy.instance()
			add_child(Spawn)
			Spawn.position.x = rand_range(-25, 25)
			Spawn.position.y = rand_range(-25, 25)
		else:
			var Spawn = Box.instance()
			add_child(Spawn)
			Spawn.rotation_degrees = rand_range(-180, 180)
			Spawn.position.x = rand_range(-25, 25)
			Spawn.position.y = rand_range(-25, 25)


