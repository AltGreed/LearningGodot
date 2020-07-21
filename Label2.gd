extends Label

var accum = 0

func _process(delta):
	accum += delta
	text = str(accum)


