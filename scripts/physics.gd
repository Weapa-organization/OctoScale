extends KinematicBody2D

const SPEED = 100
const JUMP = SPEED * SPEED
var gravity = 9.8
var velocity = Vector2()

func _physics_process(delta):
	var dir = Vector2()
	
	velocity.y += delta * gravity * SPEED
	
	if(Input.is_action_just_pressed("ui_up")):
		dir.y -= 1
	if(Input.is_action_pressed("ui_left")):
		dir.x -= 1
	if(Input.is_action_pressed("ui_right")):
		dir.x += 1
		
	dir.y = dir.y * JUMP * delta
	dir.x = dir.x * SPEED * delta

	
	velocity = move_and_slide(velocity + dir, Vector2(0,1))


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
