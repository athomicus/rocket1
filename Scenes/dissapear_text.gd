extends Label

@onready var timer = $Timer
var frame_cnt = 1
func _process(delta):
	
	if timer.time_left<2:		
		if frame_cnt % 2 == 0:
			text = text.left(-1)
	
	frame_cnt += 1	

func _on_timer_timeout():
	queue_free()		
	
	

	
	
 
