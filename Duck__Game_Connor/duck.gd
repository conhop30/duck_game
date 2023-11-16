extends Area2D
signal layEgg(pos)
# The key word "export" allows us to access/modify the variable in the Inspector.
@export var speed = 30
var title = "Duck"
var screen_size
var velocity = Vector2.ZERO # The player's movement vector
#var score = 0

func change_size(Vector2):
	$AnimatedSprite2D.scale = Vector2
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	var rng = RandomNumberGenerator.new()
	velocity.x = rng.randf_range(-1, 1)
	velocity.y = rng.randf_range(-1, 1)
	print(screen_size)
	# An attempt to await updating every frame.
	# await get_tree().create_timer(3.0).timeout

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Should wait to pick direction and move that direction.
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play() # $ - is short for get_node()
	else:
		$AnimatedSprite2D.stop()
	
	#await get_tree().create_timer(1.0).timeout
	# Update player's position
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)

	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "walk"
	# Stay within the screen

func start(pos):
	position = pos
	#show()
	$CollisionShape2D.disabled = false

func _on_body_entered(_body):
	# Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred("disabled", true)

func _on_egg_timer_timeout():
	layEgg.emit(self.position)

func _on_direction_timer_timeout():
	var rng = RandomNumberGenerator.new()
	velocity.x = rng.randf_range(-1, 1)
	velocity.y = rng.randf_range(-1, 1)
