extends RigidBody2D

export(int) var idx := 1

var is_agarrando : bool = false

func coger_agarre(posicion_agarre: Vector2):
	self.mode = MODE_STATIC
	$Tween.targeting_property(self, "global_position", self, "global_position", posicion_agarre, 1, Tween.TRANS_CIRC, Tween.EASE_IN_OUT)
	$Tween.start()

func soltar_agarre():
	self.mode = MODE_RIGID
