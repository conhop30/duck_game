extends Node
@export var Duck: PackedScene
@export var Egg: PackedScene
@export var Menu : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	$menu.hide()
	var new_egg = Egg.instantiate()
	new_egg.position = Vector2(240, 450)
	new_egg.connect("hatch",_on_egg_hatch)
	add_child(new_egg)
	$pit.connect("area_entered",_on_pit_entered)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_pit_entered(object):
	if object.title == "Duck":
		object.queue_free()

func _on_duck_lay_egg(pos):
	print("Laying an egg")
	var new_egg = Egg.instantiate()
	new_egg.position = pos
	new_egg.connect("hatch",_on_egg_hatch)
	add_child(new_egg)

func _on_egg_hatch(egg):
	print("Hatching an egg")
	var new_duck = Duck.instantiate()
	new_duck.position = egg.position
	new_duck.connect("layEgg",_on_duck_lay_egg)
	add_child(new_duck)
	# Remove egg
	egg.queue_free()

