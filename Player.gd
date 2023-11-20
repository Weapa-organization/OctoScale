extends KinematicBody2D

export(int) var idx := 1
var current_player := false
var current_index := 0
var drag : bool = false

var input := Vector2.ZERO
var pull := Vector2.ZERO
var movement := Vector2.ZERO

const speed = 200

var campath
var rope

var is_agarrando : bool = false
# Declaracion de cosas
export(String) var movement_right := "ui_right"
export(String) var movement_left := "ui_left"
export(String) var movement_up := "ui_up"
export(String) var movement_down := "ui_down"
export(bool) var is_cabeza := false

func _ready():
	#campath = get_node_or_null("/root/World").get_node("Camera2D").get_path()
	
	current_player = idx == 0
	check_if_current()


func _physics_process(_delta):
	"""
	if Input.is_action_just_pressed("ui_focus_next"):
		current_index = (current_index + 1) % (get_parent().get_children().size())
		#current_index = (current_index + 1) % 3 
		print_debug(get_parent().get_children().size())
		print_debug(current_index)
		if idx == current_index:
			current_player = true
		else: 
			current_player = false
				"""
	check_if_current()
	
	# ESTO LO USAREMOS PARA HACER TARGETING_PROPERTY con la tecla pulsada hacia el objeto agarre
	#if Input.is_key_pressed(tecla_actual)

	input = Vector2.ZERO
	if current_player:
		if Input.get_action_strength(movement_right):
			# Accedemos al tween
			print_debug(position)
			$Tween.interpolate_property(self,"position",null,position+Vector2(50,50),1,Tween.TRANS_LINEAR,Tween.EASE_IN)
			$Tween.start()
			print_debug(position)
		if Input.get_action_strength(movement_left):
			# Accedemos al tween
			$Tween.interpolate_property(self,"position",null,position+Vector2(-50,-50),1,Tween.TRANS_LINEAR,Tween.EASE_IN)
			$Tween.start()
		
	#if current_player:
	#	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	#	input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	if not is_agarrando:
		movement = move_and_slide(Vector2(0,300))
	
	if current_player:
	#if !current_player && !drag:
		pull = Vector2.ZERO
	movement = move_and_slide(input.normalized() * speed + pull)
	
	if movement != Vector2(0, 0):
		pull=Vector2(0, 0)
		movement = Vector2(0, 0)

func coger_agarre(posicion_agarre: Vector2):

	#var distancia = global_position.distance_to(posicion_agarre)
	#$Tween.interpolate_property(self,"position",null,position+distancia,1,Tween.TRANS_LINEAR,Tween.EASE_IN)
	print_debug(position)
	is_agarrando = true
	$Tween.targeting_property(self, "position", self, "position", posicion_agarre, 1, Tween.TRANS_CIRC, Tween.EASE_IN_OUT)
	$Tween.start()

func grab_cam():
	if current_player:
		$RemoteTransform2D.remote_path = campath
	else:
		$RemoteTransform2D.remote_path = ""

func check_if_current():

	$Sprite/p.visible = current_player


func _on_CheckBox_toggled(button_pressed):
	drag = button_pressed
