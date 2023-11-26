extends RigidBody2D

var pull := Vector2.ZERO
var movement := Vector2.ZERO
var agarres : Dictionary

var campath
var brazos


func _ready():
	brazos = get_parent().get_node("Manos").get_children()

func _physics_process(_delta):
	
	rotation_degrees = 90
	var dir = Vector2()
	
	agarres = $Area2D.bodies
	process_agarres()
	
	if(Input.is_action_pressed("ui_left")):
		dir.x -= 1
	if(Input.is_action_pressed("ui_right")):
		dir.x += 1

	global_position += dir * 5 	

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
							# print_debug("TENEMOS BRAZO CERCANO")
							distancia_cercana = distancia_brazo
							brazo_cercano = brazo
				if brazo_cercano != null:
					agarre.brazo = brazo_cercano
					agarre.brazo.is_agarrando = true
					agarre.is_agarrado = true
					agarre.brazo.coger_agarre(agarre.global_position) # Metodo del brazo para moverse hasta la posicion del objeto agarre	
			# Movemos al jugador
			
		if Input.is_action_just_released(agarre.tecla) and agarre.is_agarrado:
			agarre.brazo.soltar_agarre()
			agarre.is_agarrado = false
			agarre.brazo.is_agarrando = false
			agarre.brazo = null
