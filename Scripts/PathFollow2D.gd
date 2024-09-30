extends PathFollow2D

var speed = 0.01

func _process(delta):
	progress_ratio += delta * speed
	pass
