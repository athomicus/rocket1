extends Node3D
var player = preload("res://Scenes/player.tscn")
@onready var spawner = $PlayerSpawn
 
 

func _ready():
	player_instantiate()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):

	if Input.is_action_pressed("Esc"):
		get_tree().quit()
	
	if Input.is_action_pressed("Restart"):
		get_tree().reload_current_scene()
	


func player_instantiate():
	var player_spawn = player.instantiate()
	#get_tree().current_scene.addchild(player_spawn)
	spawner.add_child(player_spawn)
	emit_signal("on_player_spawn")
