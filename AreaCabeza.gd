extends Area2D

var bodies: Dictionary = {}

func _on_Area2D_body_entered(body: PhysicsBody2D):
	if body is Agarre:
		bodies[body.get_instance_id()] = body

func _on_Area2D_body_exited(body: PhysicsBody2D):
	if body != null and body.get_instance_id() in bodies:
		if body.is_agarrado:
			body.brazo.soltar_agarre()
			body.is_agarrado = false
			body.brazo.is_agarrando = false 
		var _manita_fuera = bodies.erase(body.get_instance_id())
