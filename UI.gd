extends Control
@onready var label_score: Label = $LabelScore

# Called when the node enters the scene tree for the first time.
func _ready():
	label_score.text = str(GameEvents.score)
	GameEvents.connect("update_score",Callable(self,"update_score_on_ui"))

func update_score_on_ui():
	label_score.text = str(GameEvents.score)




