extends CharacterBody2D
@onready var bullets = $"../bullets"

@onready var timer = $Timer

var bullet_type = preload("res://Scenes/green_bullet.tscn")
var targetDist = 1000
var numTargets = 0
var directions = []
var time = 1.5
# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start(time)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var target = closeEnemy()
	targetDist = target
	if directions.is_empty()==false:
		var direction = directions[0]
		rotation_degrees = direction[1]+90
	directions.clear()
	pass

func closeEnemy():
	if variables.targets.is_empty() == false:
		for x in variables.targets:
			var angle = rad_to_deg(self.global_position.angle_to_point(x.global_position))
			var distance = global_position.distance_to(x.global_position)
			var direction = []
			direction.append(x.name)
			direction.append(angle)
			direction.append(distance)
			directions.append(direction)
			#print(directions)
			#print(global_position.distance_to(x.global_position))
			#if targetDist >= global_position.distance_to(x.global_position) or numTargets == 1:
				#targetDist = global_position.distance_to(x.global_position)
				#return x
	pass

func _on_area_2d_body_entered(body):
	if 'enemy' in body.name:
		variables.targets.append(body)
		numTargets+=1
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	if 'enemy' in body.name:
		variables.targets.erase(body)
		numTargets-=1
	pass # Replace with function body.


func _on_timer_timeout():
	if variables.waveStart == true:
		if variables.targets.is_empty() == false:
			var bulletInstance = bullet_type.instantiate()
			bulletInstance.global_position = global_position
			bulletInstance.enemy = variables.targets[0].global_position
			bullets.add_child(bulletInstance)
	pass # Replace with function body.
