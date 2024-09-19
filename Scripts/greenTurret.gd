extends Sprite2D
<<<<<<< Updated upstream

var mousePos

# Called when the node enters the scene tree for the first time.
func _ready():
=======
@onready var timer = $Timer

var mouseAng

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start(5)
>>>>>>> Stashed changes
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
<<<<<<< Updated upstream
	mousePos = rad_to_deg(get_angle_to(get_global_mouse_position()))
	self.rotation(mousePos)
	pass
=======
	mouseAng = rad_to_deg(get_angle_to(get_global_mouse_position()))
	print(mouseAng)
	pass


func _on_timer_timeout():
	self.global_rotation_degrees = mouseAng
	pass # Replace with function body.
>>>>>>> Stashed changes
