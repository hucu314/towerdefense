extends ammo

func _ready():
	enemy
	speed = 350
	damage = 25
	selfDestruct = true
	direction = Vector2(0,0)
	direction = (enemy - global_position).normalized()
	print(enemy)
	pass
