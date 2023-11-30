extends StaticBody2D
class_name Agarre

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var is_final: bool = false
export var tecla = ""
var brazo : Object

var is_agarrado = false

# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if is_final and is_agarrado:
		get_tree().change_scene("res://Menu/fin_nivel.tscn")
