extends CharacterBody2D
class_name ammo

var enemy
var speed = 100
var direction = Vector2(0,0)

func _ready():
	direction = (enemy - global_position).normalized()

func _physics_process(delta):
	print(direction)
	velocity = (direction*speed)
	global_position += velocity * delta
