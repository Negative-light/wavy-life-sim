extends Node2D
class_name Part


export(bool) var connect_north = true
export(bool) var connect_east = true
export(bool) var connect_south = true
export(bool) var connect_west = true
export(float) var energy_consumption = 1.0
export(float) var weight = 1.0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#warning-ignore:unused_signal
var direction : Vector2



signal attacked()

func _ready():
	pass
	
func _process(_delta):
	pass

func spawn(pos: Vector2, dir: Vector2):
	print(pos, dir)
	pass
	
func validConnections() -> Array:
	match direction:
		Vector2.UP:
			return [connect_north, connect_east, connect_south, connect_west]
		Vector2.DOWN:
			return [connect_south, connect_west, connect_north, connect_east]
		Vector2.LEFT:
			return [connect_east, connect_south, connect_west, connect_north]
		Vector2.RIGHT:
			return [connect_west, connect_north, connect_west, connect_south]
		_:
			return [connect_north, connect_east, connect_south, connect_west]

func initEffect():
	# Return "KEY":"VALUE" where "KEY" is a know Atribute of a creature
	pass
	
func activate():
	# Should return a effect value
	pass
	

