extends Area2D
signal hatch(egg)

# Called when the node enters the scene tree for the first time.
func _ready():
	#show()
	$AnimatedSprite2D.animation = "whole"
	$AnimatedSprite2D.play()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#show()		
	pass

#func _on_mouse_entered():
		#var new_duck = duck.instantiate()
		#new_duck.position = self.position
		#get_tree().root.add_child(new_duck)
		


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("Name", self.name)
		$AnimatedSprite2D.animation = "crack"
		$AnimatedSprite2D.play()
		#await get_tree().create_timer(0.5).timeout
		#$AnimatedSprite2D.stop()	
		hatch.emit(self)
