extends Part
class_name Spike

export(int) var damageIncrease = 5;

func _init():
	connect_north = false
	connect_east = false
	connect_south = true
	connect_west = false

# Called when the node enters the scene tree for the first time.
func _ready():
	#creaturespeed += damageIncrease
	pass # Replace with function body.
