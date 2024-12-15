extends MeshInstance3D

@onready var fuel_can = $Area3D as Area3D
@onready var tank_fuel_sound :AudioStreamPlayer = $tank_fuel
# Called when the node enters the scene tree for the first time.
func _ready():
	#fuel_can.area_entered.connect(on_fuel_area_entered) # not work 'cuz player didnt have Area
	fuel_can.body_entered.connect(on_fuel_body_entered)

	 
func on_fuel_body_entered(other):
	#Player is a RigidBody3D
	 
	if other.is_in_group("Player"):
		GameEvents.score+=500
		if GameEvents.score >= 99999:
			GameEvents.score = 99999 
		#GameEvents.update_score.emit()
		#GameEvents.emit_signal("get_fuel")
		#!/bin/bashGameEvents.update_score.emit()
		tank_fuel_sound.play()
		var tween = get_tree().create_tween()
		tween.parallel().tween_property(self, "scale", scale - Vector3(0.1,0.1,0.1),0.8).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
		tween.parallel().tween_property(self, "position", position + Vector3(0,1.5,0),0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
		
		tween.tween_callback(self.queue_free)


#	print(other)
 #  print(other.name)
	#GameEvents.emit_signal("getFuel")
	#GameEvents.get_fuel.emit()
	 

