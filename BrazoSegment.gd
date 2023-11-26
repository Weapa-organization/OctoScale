extends RigidBody2D

export var grosor: float = 1.0


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.scale.x=grosor


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
