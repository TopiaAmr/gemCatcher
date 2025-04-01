extends Area2D


const PADDLE_SPEED: float = 300

#func _input(event: InputEvent) -> void:
	#pass

#func _unhandled_input(event: InputEvent) -> void:
	#pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if Input.is_action_pressed("move_right"):
		#position.x += PADDLE_SPEED * delta
	#if Input.is_action_pressed("move_left"):
		#position.x -= PADDLE_SPEED * delta
	position.x += PADDLE_SPEED * delta * Input.get_axis("move_left", "move_right")
	position.x = clampf(
		position.x,
		get_viewport_rect().position.x,
		get_viewport_rect().end.x,
	)
