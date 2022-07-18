extends Control

export var Level = "res://World/World.tscn"

func _ready():
	$VBoxContainer/Start.grab_focus()

func Start_pressed():
	get_tree().change_scene(Level)


func Settings_pressed():
	pass # Replace with function body.


func Quit_pressed():
	get_tree().quit()
