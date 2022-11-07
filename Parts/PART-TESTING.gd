extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var part = get_child(0)
	part.direction = Vector2.DOWN
	print(part.validConnections())
	part.direction = Vector2.LEFT
	print(part.validConnections())	
	part.direction = Vector2.RIGHT
	print(part.validConnections())	
	part.direction = Vector2.UP
	print(part.validConnections())
	
	var RS = Rule.new(part, part)
	print(RS.valid_matrix)
	
	var RSet = RuleSet.new()
	RSet.addPart(part)
	RSet.addPart(get_child(1))
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
