extends RigidBody3D
@export_range(750.0,3000.0) var thrust: float  = 1000
@export_range(10,110) var ship_rot: float = 100
signal change_to_next_level
@onready var explosion :AudioStreamPlayer = $Explosion
@onready var success:AudioStreamPlayer = $Success
@onready var boost:AudioStreamPlayer = $Boost
@onready var particle_for_boost: CPUParticles3D = $CPUParticles3D
var is_started_fail_or_win_sequence = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var timer := Timer.new()
	add_child(timer)
	timer.wait_time = 0.2
	timer.one_shot = false
	timer.connect("timeout",Callable(self,"_on_timer_timeout"))	
	timer.start()
	
func _on_timer_timeout():
	
	GameEvents.score -= 1
	GameEvents.update_score.emit(GameEvents.score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	particle_for_boost.emitting = false

	if Input.is_action_pressed("Throttle"):
		apply_central_force(Vector3.UP * delta * thrust) 
		play_boost_sound()
		#Vector3.UP - global
		#basis.y - local
	if Input.is_action_pressed("Right_Engine"):
		#apply_torque(Vector3(0.0,0.0,-ship_rot) * delta )
		apply_central_force(Vector3.RIGHT* delta * thrust) 
		play_boost_sound()

	if Input.is_action_pressed("Left_Engine"):
		apply_central_force(Vector3.LEFT * delta * thrust) 
		play_boost_sound()
		
		#apply_torque(Vector3(0.0,0.0,ship_rot) * delta  )



		#git config --global user.email athomicus@gmail.com
		#git config credential.helper store
		#git config --global credntial.helper store

		#git remote set-url origin git@github.com:yourname/yourrepo.git
		#git remote set-url origin git@github.com:athomicus/rocket1.git
		


func _on_body_entered(body:Node):
	#print(body.name)
	if body.is_in_group("Landing"):
		if !is_started_fail_or_win_sequence:
			success.play()
			set_process(false) # stop steering
			emit_signal("change_to_next_level")
			is_started_fail_or_win_sequence = true
		 
		#get_tree().change_scene_to_file(body.file_path)

		 
	if body.is_in_group("Floor_obstacles"):
		if !is_started_fail_or_win_sequence:
			set_process(false) # stop steering
			explosion.play()
			var tween = create_tween()
			tween.tween_interval(1.5)
			tween.tween_callback(get_tree().reload_current_scene)
			is_started_fail_or_win_sequence = true
	 
	#	get_tree().reload_current_scene()
	
	
	#if "Landing" in body.get_groups():
	#	print("yes")
	

#	get_tree().reload_current_scene()

func test_ref():
	print("reference to Player")

func play_boost_sound():	
	particle_for_boost.emitting = true
	#particle_for_boost.visible = true
	if !boost.playing:
		boost.play()
	
