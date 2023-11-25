extends RigidBody2D

export(int) var idx := 1


var is_agarrando : bool = false


func coger_agarre(posicion_agarre: Vector2):
	# print_debug(position)
	is_agarrando = true
	$Tween.targeting_property(self, "position", self, "position", posicion_agarre, 1, Tween.TRANS_CIRC, Tween.EASE_IN_OUT)
	$Tween.start()
