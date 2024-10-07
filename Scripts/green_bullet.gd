extends CharacterBody2D
class_name ammo

var enemy
var speed = 600
var direction = Vector2(0,0)
var damage = 10
var selfDestruct = true

func _ready():
	direction = (enemy - global_position).normalized()

func _physics_process(delta):
	velocity = (direction*speed)
	global_position += velocity * delta


func _on_area_2d_body_entered(body):
	if 'enemy' in body.name:
		body.get_parent().takeDamage(damage)
		if selfDestruct == true:
			queue_free()
	pass # Replace with function body.
