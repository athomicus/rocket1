extends Node3D
@onready var gauge_one = $gauge_1
@onready var gauge_ten= $gauge_10
@onready var gauge_hundr  = $gauge_100
@onready var gauge_tousand = $gauge_1000
@onready var gauge_tentousand= $gauge_10000
const ANGLE = -360/10
const ADJUST_TO_3D = 0	
var tween

#@onready var hud = $"../UI/HUD" #OK
# Called when the node enters the scene tree for the first time.
func _ready():
	#label_score.text = str(GameEvents.score)
	GameEvents.connect("update_score",Callable(self,"set_gauges"))
	#set_gauges(12345)
	#GameEvents.score=22222
	#GameEvents.update_score.emit(GameEvents.score)
	#tween.tween_interval(0.5)
	#tween.tween_callback()

	 
func set_gauges(value:int):
	
	var which_number_to_move
	var angle 
	var duration = .2

	if value > 99999:
		#za duzy zakres
		value = 99999
	 
	if tween:
		tween.kill()
	
	tween = create_tween().set_trans(Tween.TRANS_CIRC).set_parallel()

	which_number_to_move = (value) % 10
	if which_number_to_move != 0:
		which_number_to_move +=ADJUST_TO_3D #ADJUST TO 3D
	angle = ANGLE * which_number_to_move  
	
	var tween_to = Basis(Vector3.FORWARD , deg_to_rad(angle))  
###
	tween.tween_property(gauge_one,"basis",tween_to,duration)
	which_number_to_move = (value/10) % 10
	if which_number_to_move != 0:
		which_number_to_move +=ADJUST_TO_3D  #ADJUST TO 3D
	angle = ANGLE * which_number_to_move  
	
	tween_to = Basis(Vector3.FORWARD , deg_to_rad(angle))  
	tween.tween_property(gauge_ten,"basis",tween_to,duration)
 

	which_number_to_move = (value/100) % 10
	if which_number_to_move != 0:
		which_number_to_move +=ADJUST_TO_3D   #ADJUST TO 3D
	angle = ANGLE * which_number_to_move  
	tween_to = Basis(Vector3.FORWARD , deg_to_rad(angle))  
	tween.tween_property(gauge_hundr,"basis",tween_to,duration)
	 
	which_number_to_move = (value/1000) % 10
	if which_number_to_move != 0:
		which_number_to_move +=ADJUST_TO_3D   #ADJUST TO 3D
	angle = ANGLE * which_number_to_move  
	tween_to = Basis(Vector3.FORWARD , deg_to_rad(angle))  
	tween.tween_property(gauge_tousand,"basis",tween_to,duration)
 

	which_number_to_move = (value/10000) % 10
	if which_number_to_move != 0:
		which_number_to_move +=ADJUST_TO_3D #ADJUST TO 3D
	angle = ANGLE * which_number_to_move  
	tween_to = Basis(Vector3.FORWARD , deg_to_rad(angle))  
	tween.tween_property(gauge_tentousand,"basis",tween_to,duration)
  

	
	 

