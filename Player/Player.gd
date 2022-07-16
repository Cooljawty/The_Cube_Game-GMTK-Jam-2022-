extends KinematicBody2D



export var Sides = [preload("res://Gun/bullet.tscn"), preload("res://Gun/bullet.tscn"), preload("res://Gun/bullet.tscn"), preload("res://Gun/bullet.tscn"), preload("res://Gun/bullet.tscn"), preload("res://Gun/bullet.tscn")]
export var Face = 1
var debounce = 0
var debouce_movement = 0

var Rotation_ = 0

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
		

func roll(Direction_):
	#Up = 1
	#Right = 2
	#Down = 3
	#Left = 4
	var True_direction = Rotation_ + Direction_
	if True_direction > 4:
		True_direction = True_direction - 4
	# face 1
	if Face == 1:
		if True_direction == 1:
			Face = 2
			Rotation_ += 0
		elif True_direction == 2:
			Face = 3
			Rotation_ += 3
		elif True_direction == 3:
			Face = 5
			Rotation_ += 2
		elif True_direction == 4:
			Face = 4
			Rotation_ += 1
	
	elif Face == 2:
		if True_direction == 1:
			Face = 6
			Rotation_ += 0
		elif True_direction == 2:
			Face = 3
			Rotation_ += 0
		elif True_direction == 3:
			Face = 1
			Rotation_ += 0
		elif True_direction == 4:
			Face = 4
			Rotation_ += 0
	
	elif Face == 3:
		#Up
		if True_direction == 1:
			Face = 6
			Rotation_ += 3
		#Right
		elif True_direction == 2:
			Face = 5
			Rotation_ += 0
		#Down
		elif True_direction == 3:
			Face = 1
			Rotation_ += 1
		#Left
		elif True_direction == 4:
			Face = 2
			Rotation_ += 0
	
	elif Face == 4:
		#Up
		if True_direction == 1:
			Face = 6
			Rotation_ += 1
		#Right
		elif True_direction == 2:
			Face = 2
			Rotation_ += 0
		#Down
		elif True_direction == 3:
			Face = 1
			Rotation_ += 3
		#Left
		elif True_direction == 4:
			Face = 5
			Rotation_ += 0
	
	elif Face == 5:
		#Up
		if True_direction == 1:
			Face = 6
			Rotation_ += 2
		#Right
		elif True_direction == 2:
			Face = 4
			Rotation_ += 0
		#Down
		elif True_direction == 3:
			Face = 1
			Rotation_ += 2
		#Left
		elif True_direction == 4:
			Face = 3
			Rotation_ += 0
	
	elif Face == 6:
		#Up
		if True_direction == 1:
			Face = 5
			Rotation_ += 2
		#Right
		elif True_direction == 2:
			Face = 3
			Rotation_ += 1
		#Down
		elif True_direction == 3:
			Face = 2
			Rotation_ += 0
		#Left
		elif True_direction == 4:
			Face = 4
			Rotation_ += 3
	
	if Rotation_ > 3:
		Rotation_ -= 4
	
	print("true",True_direction)
	print("rotation",Rotation_)
	get_child(0).texture = Sides[Face - 1]

