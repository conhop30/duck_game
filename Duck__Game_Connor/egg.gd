extends Area2D
signal hatch(egg)

# Called when the node enters the scene tree for the first time.
func _ready():
	#show()
	pass # Replace with function body.	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#show()
	#if Input.is_action_pressed("click"):
	#	var duck = Duck.instantiate()
	#	add_child(duck)
	pass

func _on_mouse_entered():
		#var new_duck = duck.instantiate()
		#new_duck.position = self.position
		#get_tree().root.add_child(new_duck)
		hatch.emit(self)
