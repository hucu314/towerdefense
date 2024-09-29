extends Node
@onready var path_follow = $Enemies/Path2D
@onready var timer = $Timer
@onready var healthText = $health
@onready var totalEnem = 0
@onready var numEnem = 0
@onready var button = $Button
var axolot = preload("res://Scenes/axolot.tscn")
var fishEnemy = preload("res://Scenes/fish_enemy.tscn")
@onready var types = [axolot,fishEnemy]
# Called when the node enters the scene tree for the first time.
func _ready(): 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	healthText.text = "Health: " + str(variables.health)
	pass


func randEnem():
	var enemy = types.pick_random()
	var monster = enemy.instantiate()
	path_follow.add_child(monster)
	return enemy

func startWave():
	totalEnem = randi_range(7,16)
	print(totalEnem)

func _on_timer_timeout():
	if numEnem < totalEnem:
		randEnem()
		numEnem += 1
		timer.start(5)
	pass # Replace with function body.



func _on_button_pressed():
	startWave()
	timer.start(3)
	print(timer.get_time_left())
	pass # Replace with function body.
