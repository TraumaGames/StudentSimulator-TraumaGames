extends Sprite
class_name Player

onready var state = $StateMachine
export var texture_1: Texture
export var texture_2: Texture

var stats

func _ready():
	state.set_parent(self)

func stats():
	return stats

func update_stats(stats):
	self.stats = stats
	
