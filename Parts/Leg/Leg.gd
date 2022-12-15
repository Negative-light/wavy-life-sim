
class_name Leg
extends Part
export(int) var speedIncrease = 5;

func _init():
	self.connect_north = true
	self.connect_east = false
	self.connect_south = false
	self.connect_west = false

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x += 1
	#creaturespeed += speedIncrease
	pass # Replace with function body.

func _process(delta):
	position.x += 1 * delta
