extends CharacterBody2D
class_name ammo

var enemyPosition : Vector2

func _physics_process(delta):
	var maybe = moveTowards()
	print(maybe)
	
	
func moveTowards():
	var distance = global_position - enemyPosition
	return distance
