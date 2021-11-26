extends Node
export (PackedScene) var circle
var score 

func _ready():
	randomize()
	
func start_minigame():
	self.score = 0 
	$PlayerM.init($Position2D)
	$InitTimer.start()
	$Interfaz.message_value("Preparadoo")
	$Interfaz.update_score(score)

func _on_PlayerM_kick():
	$ScoreTimer.stop()
	$CircleTimer.stop()
	$Interfaz.game_over()


func _on_InitTimer_timeout():
	$ScoreTimer.start()
	$CircleTimer.start()
	


func _on_ScoreTimer_timeout():
	self.score+=1
	$Interfaz.update_score(score)

func _on_CircleTimer_timeout():
	$Path2D/PathFollow2D.set_offset(randi())
	var circ=circle.instance()
	add_child(circ)
	var direction = $Path2D/PathFollow2D.rotation
	circ.position = $Path2D/PathFollow2D.position
	direction +=rand_range(-PI/4,PI/4) 
	circ.rotation = direction 
	circ.set_linear_velocity(Vector2(rand_range(circ.velocity_min,circ.velocity_max),0).rotated(direction))
	


func _on_Interfaz_init_game():
	pass # Replace with function body.
