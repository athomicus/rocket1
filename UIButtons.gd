extends Control 


# Called when the node enters the scene tree for the first time.
func _ready():
	register_touch_buttons() 


func register_touch_buttons():
	var buttons_list = get_tree().get_nodes_in_group("buttons")
	if buttons_list.size() > 0:
		for b in buttons_list:
			if b is ScreenButton:
				b.clicked.connect(_on_touch_button_pressed)

func _on_touch_button_pressed(button):
	print(button.name)