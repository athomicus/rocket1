extends Node3D
@export_file("*.tscn") var file_path = "Level02.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("/root/main").connect("on_player_spawn",Callable(self,"_on_player_spawn"))
	
	#	player.connect("change_to_next_level",Callable(self, "_change_to_next_level"))
	 
  
func _change_to_next_level():
	#print("signal chane to next level")
	var tween = create_tween()
	tween.tween_interval(1.0)
	tween.tween_callback(get_tree().change_scene_to_file.bind(file_path))
	#get_tree().change_scene_to_file(file_path)

func _on_player_spawn():
	var player = get_node("/root/main/PlayerSpawn/Player")   # Ok   
	player.connect("change_to_next_level",Callable(self,"_change_to_next_level"))
	#player.test_ref()	 
    #get_tree().call_group("guard", "enter_alert_mode")
	#get_tree().get_root().find_node("node_name").