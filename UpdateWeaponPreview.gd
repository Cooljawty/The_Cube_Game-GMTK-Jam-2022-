extends GridContainer

var Sides = [load("res://Gun/guns/ol classic.png"), load("res://Gun/guns/funny grav gun.png"), load("res://Gun/guns/burst gun.png"),  load("res://Gun/guns/fish dula gun.png"), load("res://Gun/guns/shotgun.png"), load("res://Gun/guns/minigun.png")]

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_player_move(current_face):
	get_child(0).get_child(0).texture = Sides[current_face[0]-1]
	get_child(0).get_child(1).texture = Sides[current_face[1]-1]
	get_child(0).get_child(2).texture = Sides[current_face[2]-1]
	get_child(0).get_child(3).texture = Sides[current_face[3]-1]
	get_child(0).get_child(4).texture = Sides[current_face[4]-1]
