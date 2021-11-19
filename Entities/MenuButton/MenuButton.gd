extends TextureButton


export (String) var text:String setget set_text
onready var textLabel:Label = $Text

# Called when the node enters the scene tree for the first time.
func _ready():
	textLabel.text = text

func set_text(newText:String):
	text = newText
	if textLabel != null:
		textLabel.text = newText


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
