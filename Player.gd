extends KinematicBody2D


export var Side_1 = preload("res://a die 1.png")
export var Side_2 = preload("res://a die 2.png")
export var Side_3 = preload("res://a die 3.png")
export var Side_4 = preload("res://a die 4.png")
export var Side_5 = preload("res://a die 5.png")
export var Side_6 = preload("res://a die 6.png")
var Face = 1
var debounce = 0
var debouce_movement = 0

func _input(event):
	if Input.is_action_just_pressed("Up") and debouce_movement == 0:
		debouce_movement = 1
		move_and_collide(Vector2(0,-64))
		roll("Up")
		debouce_movement = 0
	if Input.is_action_just_pressed("Down") and debouce_movement == 0:
		debouce_movement = 1
		move_and_collide(Vector2(0,64))
		roll("Down")
		debouce_movement = 0
	if Input.is_action_just_pressed("Right") and debouce_movement == 0:
		debouce_movement = 1
		
		move_and_collide(Vector2(64,0))
		roll("Right")
		debouce_movement = 0
	if Input.is_action_just_pressed("Left") and debouce_movement == 0:
		debouce_movement = 1
		move_and_collide(Vector2(-64,0))
		roll("Left")
		debouce_movement = 0
		

func roll(Direction_):
	# face 1
	if Face == 1:
		if Direction_ == "Down" and debounce == 0:
			debounce = 1
			self.get_child(0).set_texture(Side_5)
			Face = 5
			print(Face)
			debounce = 0
		elif Direction_ == "Up" and debounce == 0:
			debounce = 1
			self.get_child(0).set_texture(Side_2)
			Face = 2
			print(Face)
			debounce = 0
		elif Direction_ == "Right" and debounce == 0:
			debounce = 1
			self.get_child(0).set_texture(Side_3)
			Face = 3
			print(Face)
			debounce = 0
		elif Direction_ == "Left" and debounce == 0:
			debounce = 1
			self.get_child(0).set_texture(Side_4)
			Face = 4
			print(Face)
			debounce = 0
		
	# face 2
	if Face == 2 and Direction_ == "Down" and debounce == 0:
		debounce = 1
		self.get_child(0).set_texture(Side_1)
		Face = 1
		print(Face)
		debounce = 0
	elif Face == 2 and Direction_ == "Up" and debounce == 0:
		debounce = 1
		self.get_child(0).set_texture(Side_6)
		Face = 6
		print(Face)
		debounce = 0
	elif Face == 2 and Direction_ == "Right" and debounce == 0:
		debounce = 1
		self.get_child(0).set_texture(Side_3)
		Face = 3
		print(Face)
		debounce = 0
	elif Face == 2 and Direction_ == "Left" and debounce == 0:
		debounce = 1
		self.get_child(0).set_texture(Side_4)
		Face = 4
		print(Face)
		debounce = 0
		
	# face 3
	if Face == 3 and Direction_ == "Down" and debounce == 0:
		debounce = 1
		self.get_child(0).set_texture(Side_2)
		Face = 2
		print(Face)
		debounce = 0
	elif Face == 3 and Direction_ == "Up" and debounce == 0:
		debounce = 1
		self.get_child(0).set_texture(Side_5)
		Face = 5
		print(Face)
		debounce = 0
	elif Face == 3 and Direction_ == "Right" and debounce == 0:
		debounce = 1
		self.get_child(0).set_texture(Side_6)
		Face = 6
		print(Face)
		debounce = 0
	elif Face == 3 and Direction_ == "Left" and debounce == 0:
		debounce = 1
		self.get_child(0).set_texture(Side_1)
		Face = 1
		print(Face)
		debounce = 0
	
	# face 4
	if Face == 4 and Direction_ == "Down" and debounce == 0:
		debounce = 1
		self.get_child(0).set_texture(Side_5)
		Face = 5
		print(Face)
		debounce = 0
	elif Face == 4 and Direction_ == "Up" and debounce == 0:
		debounce = 1
		self.get_child(0).set_texture(Side_2)
		Face = 2
		print(Face)
		debounce = 0
	elif Face == 4 and Direction_ == "Right" and debounce == 0:
		debounce = 1
		self.get_child(0).set_texture(Side_1)
		Face = 1
		print(Face)
		debounce = 0
	elif Face == 4 and Direction_ == "Left" and debounce == 0:
		debounce = 1
		self.get_child(0).set_texture(Side_6)
		Face = 6 
		print(Face)
		debounce = 0
	
	# face 5
	if Face == 5 and Direction_ == "Down" and debounce == 0:
		debounce = 1
		self.get_child(0).set_texture(Side_6)
		Face = 6
		print(Face)
		debounce = 0
	elif Face == 5 and Direction_ == "Up" and debounce == 0:
		debounce = 1
		self.get_child(0).set_texture(Side_1)
		Face = 1
		print(Face)
		debounce = 0
	elif Face == 5 and Direction_ == "Right" and debounce == 0:
		debounce = 1
		self.get_child(0).set_texture(Side_3)
		Face = 3
		print(Face)
		debounce = 0
	elif Face == 5 and Direction_ == "Left" and debounce == 0:
		debounce = 1
		self.get_child(0).set_texture(Side_4)
		Face = 4
		print(Face)
		debounce = 0
	
	# face 6
	if Face == 6 and Direction_ == "Down" and debounce == 0:
		debounce = 1
		self.get_child(0).set_texture(Side_5)
		Face = 2
		print(Face)
		debounce = 0
	elif Face == 6 and Direction_ == "Up" and debounce == 0:
		debounce = 1
		self.get_child(0).set_texture(Side_2)
		Face = 5
		print(Face)
		debounce = 0
	elif Face == 6 and Direction_ == "Right" and debounce == 0:
		debounce = 1
		self.get_child(0).set_texture(Side_3)
		Face = 3
		print(Face)
		debounce = 0
	elif Face == 6 and Direction_ == "Left" and debounce == 0:
		debounce = 1
		self.get_child(0).set_texture(Side_4)
		Face = 4
		print(Face)
		debounce = 0



