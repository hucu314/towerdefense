extends Node
@onready var path_follow = $Enemies/Path2D
@onready var timer = $Timer
var fishEnemy = preload("res://Scenes/fish_enemy.tscn")
# Called when the node enters the scene tree for the first time.
func _ready(): 
	var instance = fishEnemy.instantiate()
	path_follow.add_child(instance)
	$Timer.start(5)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	pass


func _on_timer_timeout():
	#create new pathfollow2d
	#add enemy to that pf2d
	#add pf2d to path
	var instance = fishEnemy.instantiate()
	path_follow.add_child(instance)
	pass # Replace with function body.
