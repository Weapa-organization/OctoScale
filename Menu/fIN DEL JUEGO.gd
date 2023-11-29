extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$SiguienteNivelButton.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_SiguienteNivelButton_pressed():
	get_tree().change_scene("res://Worlds/World_3.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()
