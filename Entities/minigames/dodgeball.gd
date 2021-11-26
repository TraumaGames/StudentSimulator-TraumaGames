extends Area2D

export (int) var velocity
var moving:Vector2= Vector2()
var limit
signal kick

func _ready():
	self.limit= get_viewport_rect().size
	
func _process(delta):
	self.moving = Vector2()
	if(Input.is_action_pressed("up")):
		moving.y+=1
	if(Input.is_action_pressed("down")):
		moving.y-=1
	if(Input.is_action_pressed("left")):
		moving.x-=1
	if(Input.is_action_pressed("right")):
		moving.x+=1
	if moving.length()>0 : 
		moving= moving.normalized() + velocity
	position+=moving*delta
	position.x=clamp(position.x,0,limit.x)
	position.y=clamp(position.y,0,limit.y)


func _on_minigame_body_entered(body):
	hide()
	emit_signal("golpe")
	$CollisionShape2D.disabled=true
	
	
func init(pos):
	position= pos
	show()
	$CollisionShape2D.disabled=false

