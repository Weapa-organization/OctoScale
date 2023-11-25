extends KinematicBody2D

export(int) var idx := 1
var current_player := false
var current_index := 0
var drag : bool = false

var input := Vector2.ZERO
var pull := Vector2.ZERO
var movement := Vector2.ZERO

const speed = 200

var rope

var is_agarrando : bool = false

func _physics_process(_delta):
	
	if not is_agarrando:
		movement = move_and_slide(Vector2(0,300))

func coger_agarre(posicion_agarre: Vector2):
	print_debug(position)
	is_agarrando = true
	$Tween.targeting_property(self, "position", self, "position", posicion_agarre, 1, Tween.TRANS_CIRC, Tween.EASE_IN_OUT)
	$Tween.start()
