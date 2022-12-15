class_name RuleSet

var parts = []
var rules = []

func addPart(P):
	parts.append(P)
	for dest in parts:
		rules.append(Rule.new(P, dest))
