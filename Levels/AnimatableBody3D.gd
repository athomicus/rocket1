extends AnimatableBody3D

@export var destination:Vector3
@export var duration:float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = create_tween()
	#tween.tween_interval(duration)
	tween.set_loops()
	tween.set_trans(Tween.TRANS_SINE)
	tween.tween_property(self,"position",position + destination,duration)
	tween.tween_property(self,"position",position,duration)


