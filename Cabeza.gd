extends KinematicBody2D

var pull := Vector2.ZERO
var movement := Vector2.ZERO
var agarres : Dictionary

var campath
var brazos 
# Called when the node enters the scene tree for the first time.
func _ready():
	#campath = get_node_or_null("/root/World").get_node("Camera2D").get_path()
	brazos = get_parent().get_node("Players").get_children()

func _physics_process(_delta):
	#$RemoteTransform2D.remote_path = campath
	
	movement = move_and_slide(Vector2(0, 100) + pull)
	
	if movement != Vector2.ZERO:
		pull = Vector2.ZERO
		movement = Vector2.ZERO

	agarres = $Area2D.bodies
	brazos.shuffle()
	process_agarres()
	

func process_agarres():
	for agarre in agarres.values():
		var brazo_cercano : Object = null
		var distancia_cercana : float = INF
		if Input.is_action_pressed(agarre.tecla):
			# Si la pieza no esta cogida y el jugador no esta cogiendo
			if not agarre.is_agarrado:
				for brazo in brazos:
					if not brazo.is_agarrando: # xd
						var distancia_brazo = brazo.global_position.distance_to(agarre.global_position)
						if distancia_brazo < distancia_cercana:
							print_debug("TENEMOS BRAZO CERCANO")
							distancia_cercana = distancia_brazo
							brazo_cercano = brazo
				if brazo_cercano != null:
					brazo_cercano.coger_agarre(agarre.global_position) # Metodo del brazo para moverse hasta la posicion del objeto agarre
					agarre.is_agarrado=true
					agarre.brazo = brazo_cercano
			# Movemos al jugador
			
		if Input.is_action_just_released(agarre.tecla) and agarre.is_agarrado:
			agarre.is_agarrado = false
			agarre.brazo.is_agarrando = false
