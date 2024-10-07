extends Tower

func _ready():
	bullet_type = preload("res://Scenes/red_bullet.tscn")
	time = 2
	targetDist = 1000
	numTargets = 0
	directions = []
	timer.start(time)
	pass
