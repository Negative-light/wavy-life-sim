class_name Attribute

var id : String
var value : float

var value_range = [-1, 1]

func update_value(change):
	var temp = value + change
	if temp < value_range[0] || temp > value_range[1]:
		return false
	else:
		value = temp
		return true
