extends RigidBody3D
@export_range(750.0,3000.0) var thrust: float  = 1000
@export_range(10,110) var ship_rot: float = 100
signal change_to_next_level

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Throttle"):
		apply_central_force(Vector3.UP * delta * thrust) 
		#Vector3.UP - global
		#basis.y - local
	if Input.is_action_pressed("Right_Engine"):
		#apply_torque(Vector3(0.0,0.0,-ship_rot) * delta )
		apply_central_force(Vector3.RIGHT* delta * thrust) 


	if Input.is_action_pressed("Left_Engine"):
		apply_central_force(Vector3.LEFT * delta * thrust) 
		#apply_torque(Vector3(0.0,0.0,ship_rot) * delta  )



		#git config --global user.email athomicus@gmail.com
		#git config credential.helper store
		#git config --global credntial.helper store

		#git remote set-url origin git@github.com:yourname/yourrepo.git
		#git remote set-url origin git@github.com:athomicus/rocket1.git
		


func _on_body_entered(body:Node):
	#print(body.name)
	if body.is_in_group("Landing"):
		emit_signal("change_to_next_level")
		print("emit signal strt")
		#get_tree().change_scene_to_file(body.file_path)
	#	print(str(body.file_path))
		 
	if body.is_in_group("Floor_obstacles"):
		set_process(false)
		var tween = create_tween()
		tween.tween_interval(1.0)
		tween.tween_callback(get_tree().reload_current_scene)
	 
	#	get_tree().reload_current_scene()
	
	
	#if "Landing" in body.get_groups():
	#	print("yes")
	

#	get_tree().reload_current_scene()

func test_ref():
	print("reference to Player")
