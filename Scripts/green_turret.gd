extends CharacterBody2D


var target =  self

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var angle = rad_to_deg(self.global_position.angle_to_point(target.global_position))
	print(angle)
	rotation_degrees = angle+90
	pass

func _on_area_2d_body_entered(body):
	target = body
	pass # Replace with function body.
