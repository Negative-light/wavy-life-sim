extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(int) var baseSpeed = 1;
var speedIncrease = 0;
export(int) var baseHealth = 1;
var healthIncrease = 0;
export(int) var max_parts = 100;
# Called when the node enters the scene tree for the first time.
func _ready():
	# Build Body
	# Apply Initial Effects
	# Spawn
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _applyEffect(key, value):
	match key:
		"HEALTH":
			healthIncrease += value
		"SPEED":
			speedIncrease += value
		_:
			print("ERROR STATE-Invalid Effect Key")
