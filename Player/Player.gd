extends KinematicBody2D

signal player_move(current_face)
export var Sides = [preload("res://Dicesides/die1sheet.png"), preload("res://Dicesides/die2sheet.png"),preload("res://Dicesides/die3sheet.png"),preload("res://Dicesides/die4sheet.png"),preload("res://Dicesides/die5sheet.png"),preload("res://Dicesides/die6sheet.png")]
export var Face = 1
var debounce = 0
var debouce_movement = 0

export var health = 100

var Rotation_ = 0

func _ready():
	get_node("/root/Global").Wtf_is_Player(self)
	get_child(6).start()

func _process(delta):
	"""
	get_child(1).scale.x += 0.01
	get_child(1).position.x += 0.15
	get_child(0).scale.x -= 0.01
	get_child(0).position.x += 0.15
	if get_child(1).scale.x > 2:
		get_child(1).scale.x = 0
		get_child(1).position.x = -30
		get_child(0).scale.x = 2
		get_child(0).position.x = 0
	"""
	get_child(10).value = health
	if health < 1:
		get_tree().change_scene("res://Menu.tscn")
	
func _input(event):
	# - 5 - -
	# 3 1 4 6
	# - 2 - -
	# - 6 - -
	if Input.is_action_just_pressed("Up") and debouce_movement == 0:
		debouce_movement = 1
		move_and_collide(Vector2(0,-64))
		roll(1)
		debouce_movement = 0
	if Input.is_action_just_pressed("Right") and debouce_movement == 0:
		debouce_movement = 1
		move_and_collide(Vector2(64,0))
		roll(2)
		debouce_movement = 0
	if Input.is_action_just_pressed("Down") and debouce_movement == 0:
		debouce_movement = 1
		move_and_collide(Vector2(0,64))
		roll(3)
		debouce_movement = 0
	if Input.is_action_just_pressed("Left") and debouce_movement == 0:
		debouce_movement = 1
		move_and_collide(Vector2(-64,0))
		roll(4)
		debouce_movement = 0
		
func get_next_face(next_direction, current_rotation, current_face):
	#Up = 1
	#Right = 2
	#Down = 3
	#Left = 4
	var True_direction = current_rotation + next_direction
	if True_direction > 4:
		True_direction = True_direction - 4
	# face 1
	if current_face == 1:
		if True_direction == 1:
			current_face = 2
			current_rotation += 0
		elif True_direction == 2:
			current_face = 3
			current_rotation += 3
		elif True_direction == 3:
			current_face = 5
			current_rotation += 2
		elif True_direction == 4:
			current_face = 4
			current_rotation += 1
	
	elif current_face == 2:
		if True_direction == 1:
			current_face = 6
			current_rotation += 0
		elif True_direction == 2:
			current_face = 3
			current_rotation += 0
		elif True_direction == 3:
			current_face = 1
			current_rotation += 0
		elif True_direction == 4:
			current_face = 4
			current_rotation += 0
	
	elif current_face == 3:
		#Up
		if True_direction == 1:
			current_face = 6
			current_rotation += 3
		#Right
		elif True_direction == 2:
			current_face = 5
			current_rotation += 0
		#Down
		elif True_direction == 3:
			current_face = 1
			current_rotation += 1
		#Left
		elif True_direction == 4:
			current_face = 2
			current_rotation += 0
	
	elif current_face == 4:
		#Up
		if True_direction == 1:
			current_face = 6
			current_rotation += 1
		#Right
		elif True_direction == 2:
			current_face = 2
			current_rotation += 0
		#Down
		elif True_direction == 3:
			current_face = 1
			current_rotation += 3
		#Left
		elif True_direction == 4:
			current_face = 5
			current_rotation += 0
	
	elif current_face == 5:
		#Up
		if True_direction == 1:
			current_face = 6
			current_rotation += 2
		#Right
		elif True_direction == 2:
			current_face = 4
			current_rotation += 0
		#Down
		elif True_direction == 3:
			current_face = 1
			current_rotation += 2
		#Left
		elif True_direction == 4:
			current_face = 3
			current_rotation += 0
	
	elif current_face == 6:
		#Up
		if True_direction == 1:
			current_face = 5
			current_rotation += 2
		#Right
		elif True_direction == 2:
			current_face = 3
			current_rotation += 1
		#Down
		elif True_direction == 3:
			current_face = 2
			current_rotation += 0
		#Left
		elif True_direction == 4:
			current_face = 4
			current_rotation += 3
	
	if current_rotation > 3:
		current_rotation -= 4
	
	return [current_rotation, current_face]

func roll(Direction_):
	var result = get_next_face(Direction_, Rotation_, Face)
	Rotation_ = result[0]
	Face = result[1]
	
	var preview = [
		Face,
		get_next_face(1, Rotation_, Face)[1],
		get_next_face(2, Rotation_, Face)[1],
		get_next_face(3, Rotation_, Face)[1],
		get_next_face(4, Rotation_, Face)[1],
	]
	emit_signal("player_move", preview)
	
	#print("true",True_direction)
	#print("rotation",Rotation_)
	get_child(0).texture = Sides[Face - 1]
	$AnimationPlayer.stop()
	get_child(0).set_frame(0)



func _on_Idle_timeout():
	$AnimationPlayer.play("Player Movement")


func _on_Player_Hitbox_area_entered(area):
	if area.name == "Enemy_Area":
		health -= 3
