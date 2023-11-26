extends Area2D

var bodies: Dictionary = {}

func _on_Area2D_body_entered(body: PhysicsBody2D):
	if body is Agarre:
		bodies[body.get_instance_id()] = body

func _on_Area2D_body_exited(body: PhysicsBody2D):
	if body.get_instance_id() in bodies:
		var _manita_fuera = bodies.erase(body.get_instance_id())
