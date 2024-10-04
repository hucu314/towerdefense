extends CharacterBody2D
const bullet = preload("res://Scenes/bullet.tscn")
@onready var timer = $Timer

var targetDist = 1000
var numTargets = 0
var directions = []
# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start(5)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var target = closeEnemy()
	targetDist = target
	if directions.is_empty()==false:
		var direction = directions[0]
		#print('Name: '+str(direction[0]))
		#print('Angle: '+str(direction[1]))
		#print('Distance: '+str(direction[2]))
		rotation_degrees = direction[1]+90
	directions.clear()
	if target != null:
		var angle = rad_to_deg(self.global_position.angle_to_point(target.global_position))
		rotation_degrees = angle+90
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
	print(body.name)
	if 'enemy' in body.name:
		variables.targets.append(body)
		numTargets+=1
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	print(body.name)
	if 'enemy' in body.name:
		variables.targets.erase(body)
		numTargets-=1
	pass # Replace with function body.


func _on_timer_timeout():
	if variables.waveStart == true:
		if variables.targets.is_empty() == false:
			var bulletInstance = bullet.instantiate()
			print(bulletInstance)
			bulletInstance.global_position = global_position
			bulletInstance.enemy = variables.targets[0].global_position
			add_child(bulletInstance)
			print('bullet instnatitated')
	pass # Replace with function body.
