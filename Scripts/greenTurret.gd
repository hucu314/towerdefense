extends Sprite2D

var mousePos


@onready var timer = $Timer

var mouseAng

# Called when the node enters the scene tree for the first time.
func _ready():
	#$Timer.start(5)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#mouseAng = rad_to_deg())
	var angle = rad_to_deg(global_position.angle_to_point(get_global_mouse_position()))
	print(angle)
	rotation_degrees = angle
	pass

#func _on_timer_timeout():
#	self.global_rotation_degrees = mouseAng
#	print('new angle')
#	pass # Replace with function body.
