extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var current_player = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_focus_next"):
		print_debug("EMTROASDLJASHLDKLJ")
		current_player = (current_player + 1) % get_children().size()

		for children in get_children():
			children.current_player = children.idx == current_player
		
		for agarre in get_parent().get_node("Agarres").get_children():
			
			pass
		""""
		for i in range(get_children().size()):
			print_debug(i)
			if i == current_player:
				get_child(i).current_player = true
			else:
				get_child(i).current_player = false
				"""
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
