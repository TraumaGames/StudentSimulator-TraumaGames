extends Sprite
class_name Player

onready var state = $StateMachine
export var texture_1: Texture
export var texture_2: Texture

var energy: int
var sanity: int
var self_stem: int

func _ready():
	state.set_parent(self)

func _update_texture(stats):
	state.notify_stats_updated(stats)
