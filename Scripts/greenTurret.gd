extends Sprite2D

var mousePos

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mousePos = rad_to_deg(get_angle_to(get_global_mouse_position()))
	self.rotation(mousePos)
	pass
