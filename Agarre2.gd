extends StaticBody2D
class_name Agarre2

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
		var t = Timer.new()
		t.set_wait_time(1)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		t.queue_free()
		get_tree().change_scene("res://Menu/fin_nivel.tscn")
