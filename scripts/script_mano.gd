extends RigidBody2D

export(int) var idx := 1

var is_agarrando : bool = false
var agarre: Agarre

func _physics_process(i: float):
	
	if not is_agarrando and agarre == null:
		soltar_agarre()

func coger_agarre(posicion_agarre: Vector2, agarre: Agarre):
	self.mode = MODE_STATIC
	$Tween.targeting_property(self, "global_position", self, "global_position", posicion_agarre, 1.3, Tween.TRANS_CIRC, Tween.EASE_IN_OUT)
	$Tween.start()

func soltar_agarre():
	agarre = null
	self.mode = MODE_RIGID
