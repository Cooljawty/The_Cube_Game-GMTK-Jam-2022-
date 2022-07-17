extends TileMap

export var Templets : PoolVector2Array = []
export var Room = preload("res://World/Room.tscn")

func _ready():
	for n in Templets.size():
		var Room_slot = Room.instance()
		add_child(Room_slot)
		Room_slot.global_position = Templets[n]
		print(Room_slot.global_position)
