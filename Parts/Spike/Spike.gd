extends Part
class_name Spike

export(int) var damageIncrease = 5;

func _init():
	self.connect_north = false
	self.connect_east = false
	self.connect_south = true
	self.connect_west = false

# Called when the node enters the scene tree for the first time.
func _ready():
	#othercreaturehealth += damageIncrease
	pass # Replace with function body.
