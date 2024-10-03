extends PathFollow2D
class_name Enemies

@onready var enemy = $"."
@onready var animated_sprite = $CharacterBody2D/AnimatedSprite2D
@onready var path_follow : Path2D = $Path2D
@export var speed = 100
@export var health = 100
@export var damage = 5
@export var last_position : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	last_position = global_position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = dirAnimation(global_position-last_position)
	last_position = global_position
	enemy.progress += speed*delta
	if self.progress_ratio >= .999:
		variables.health -= damage
		variables.totalEnem -= 1
		print(variables.totalEnem)
		self.queue_free()
	if health == 0:
		variables.totalEnem -= 1
		print(variables.totalEnem)
		self.queue_free()
	pass

func dirAnimation(direction:Vector2):
	if direction.x > 0 and direction.y == 0:
		animated_sprite.set_animation('right')
	if direction.x < 0 and direction.y == 0:
		animated_sprite.set_animation('left')
	if direction.x == 0 and direction.y > 0:
		animated_sprite.set_animation('front')
	if direction.x == 0 and direction.y < 0:
		animated_sprite.set_animation('back')

	

