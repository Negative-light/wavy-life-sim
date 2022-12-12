extends Part
class_name Leg

export(int) var speedIncrease = 5;

func _init():
	connect_north = true
	connect_east = false
	connect_south = false
	connect_west = false

# Called when the node enters the scene tree for the first time.
func _ready():
	#creaturespeed += speedIncrease
	pass # Replace with function body.
