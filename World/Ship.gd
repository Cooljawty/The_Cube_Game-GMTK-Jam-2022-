extends Sprite

export var Templets : Array = [PoolVector2Array()]
export var Room = preload("res://World/Room.tscn")

func _ready():
	for n in Templets[0].size():
		var Room_slot = Room.instance()
		add_child(Room_slot)
		Room_slot.global_position = Templets[0][n]
		print(Room_slot.global_position)
