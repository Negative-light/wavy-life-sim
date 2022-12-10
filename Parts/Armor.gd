extends Part
class_name Armor

export(int) var healthIncrease = 5;

func _init():
	connect_north = false
	connect_east = false
	connect_south = true
	connect_west = false

# Called when the node enters the scene tree for the first time.
func _ready():
	#creaturehealth += healthIncrease
	pass # Replace with function body.
