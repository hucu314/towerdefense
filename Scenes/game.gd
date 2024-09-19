extends Node
@onready var path_follow = $Enemies/Path2D/PathFollow2D
@onready var timer = $Timer

var fishEnemy = preload("res://Scenes/fishEnemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready(): 
	$Timer.start(5)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	pass


func _on_timer_timeout():
	#create new pathfollow2d
	var pathFollow = PathFollow2D.new()
	var enemy = fishEnemy.instantiate()
	#add enemy to that pf2d
	#add pf2d to path
	var instance = fishEnemy.instantiate()
	pathFollow.add_child(instance)
	pass # Replace with function body.
