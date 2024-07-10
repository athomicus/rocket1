extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Throttle"):
		apply_central_force(Vector3.UP * delta * 1000) 
		
	if Input.is_action_pressed("Right"):
		apply_torque(Vector3(0.0,0.0,-100.0) * delta )


	if Input.is_action_pressed("Left"):
		apply_torque(Vector3(0.0,0.0,100.0) * delta  )



		#
		
		
