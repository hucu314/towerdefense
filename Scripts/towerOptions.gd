extends MenuButton

@onready var towers = $"../../turrets"
const normal = preload("res://Scenes/green_turret.tscn")
const pierce = preload("res://Scenes/red_turret.tscn")
const tank = preload("res://Scenes/heavy_turret.tscn")

func _on_gui_input(event):
	print(event.get_item_text())
	
	pass # Replace with function body.


func _ready():
	var popup = get_popup()
	popup.id_pressed.connect(file_menu)

func file_menu(id):
	if id == 0:
		var instance = normal.instantiate()
		instance.position.x = global_position.x+100
		instance.position.y = global_position.y+100
		towers.add_child(instance)
	if id == 1:
		var instance = pierce.instantiate()
		instance.position.x = global_position.x+100
		instance.position.y = global_position.y+100
		towers.add_child(instance)
	if id == 2:
		var instance = tank.instantiate()
		instance.position.x = global_position.x+100
		instance.position.y = global_position.y+100
		towers.add_child(instance)
	print(id)
