class_name RuleSet

var Parts = []
var Rules = []

func addPart(P):
	Parts.append(P)
	for dest in Parts:
		Rules.append(Rule.new(P, dest))
		print(Rules)
