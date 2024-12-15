extends TouchScreenButton
#change sound on/ off

var music_bas = AudioServer.get_bus_index("Master")
@onready var  on_icon = load("res://UI/gui_icons/sound_on_white.png")
@onready var  off_icon = load("res://UI/gui_icons/sound_off_white.png")


func _ready():
	 

	self.texture_normal = on_icon
	self.pressed.connect(Callable(self,"changes"))
	if AudioServer.is_bus_mute(music_bas):
		texture_normal = off_icon

func changes():
	AudioServer.set_bus_mute(music_bas, not AudioServer.is_bus_mute(music_bas))

	if texture_normal == off_icon:
		texture_normal = on_icon
	else:
		texture_normal = off_icon
#player.connect("change_to_next_level",Callable(self,"_change_to_next_level"))