extends Tower

func _ready():
	bullet_type = preload("res://Scenes/heavy_bullet.tscn")
	time = 3.5
	targetDist = 1000
	numTargets = 0
	directions = []
	timer.start(time)
	pass
