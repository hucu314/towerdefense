extends ammo

func _ready():
	enemy
	speed = 500
	damage = 5
	selfDestruct = false
	direction = Vector2(0,0)
	direction = (enemy - global_position).normalized()
	print(enemy)
	pass
