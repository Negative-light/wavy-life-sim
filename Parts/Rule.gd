class_name Rule

var Base : Part
var Dest : Part
var Weight : float

var valid_matrix = []

func _init(B, D):
	Base = B;
	Dest = D;
	genMatrix()
	
func genMatrix():
	self.valid_matrix = [];
	var Base_cons = self.Base.validConnections()
	var Dest_cons = self.Dest.validConnections()
	for x in range(0, len(Base_cons)):
		self.valid_matrix.append([])
		for y in range(0, len(Dest_cons)):
			self.valid_matrix[x].append(Base_cons[x] && Dest_cons[y])
