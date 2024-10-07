extends Node
@onready var path_follow = $Enemies/Path2D
@onready var timer = $Timer
@onready var healthText = $labels/health
@onready var wallet = $labels/wallet
@onready var waveEnem = 0
@onready var numEnem = 0
@onready var button = $buttons/Button
@onready var countdown = false
@onready var countTimer = $countTimer
var axolot = preload("res://Scenes/axolot_enemy.tscn")
var fishEnemy = preload("res://Scenes/fish_enemy.tscn")
var cyclops = preload("res://Scenes/cyclops_enemy.tscn")
@onready var types = [axolot,fishEnemy,cyclops]
@onready var restart = $buttons/restart
@onready var wave_num = $labels/waveNum

# Called when the node enters the scene tree for the first time.
func _ready(): 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if countdown == true:
		countTimer.visible = true
		countTimer.text = str(int(timer.get_time_left())+1)
	if variables.totalEnem==0 and countdown == false:
		button.visible=true
		variables.waveStart = false
	if variables.health <=0 :
		variables.health = 100
		variables.totalEnem = 0
		variables.targets = []
		variables.waveStart = false
		variables.money = 30
		variables.enemies = 0
		get_tree().reload_current_scene()
	healthText.text = "Health: " + str(variables.health)
	wallet.text = '$'+ str(variables.money)
	wave_num.text = "Kills" + str(variables.enemies)
	pass


func randEnem():
	var enemy = types.pick_random()
	var monster = enemy.instantiate()
	path_follow.add_child(monster)
	variables.totalEnem+=1
	print(variables.totalEnem)
	return enemy

func startWave():
	waveEnem = randi_range(7,16)
	button.visible = false
	variables.waveStart = true

func _on_timer_timeout():
	countdown = false
	countTimer.visible = false
	if numEnem < waveEnem:
		randEnem()
		numEnem += 1
		timer.start(randi_range(1,4))
	pass # Replace with function body.



func _on_button_pressed():
	startWave()
	timer.start(3)
	countdown = true
	button.visible = false
	pass # Replace with function body.



func _on_restart_pressed():
	variables.health = 100
	variables.totalEnem = 0
	variables.targets = []
	variables.waveStart = false
	variables.money = 30
	variables.enemies = 0
	get_tree().reload_current_scene()
	pass # Replace with function body.
