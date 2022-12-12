class_name Attribute
# Creature Attributes
enum AttributeTypes {
	HEALTH,
	SPEED,
	ENERGY,
	HUNGER
}

var type
var value : float
var value_range : Range

func update_value(change):
	var temp = value + change
	if temp < value_range.min_value || temp > value_range.max_value:
		return false
	else:
		value = temp
		return true
