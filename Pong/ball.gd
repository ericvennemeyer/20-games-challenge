class_name Ball
extends CharacterBody2D

const SPEED = 400.0

@onready var ball_sfx_player: AudioStreamPlayer = $BallSFXPlayer


func start(_position, _direction) -> void:
	rotation = deg_to_rad(_direction)
	position = _position
	velocity = Vector2(SPEED, 0).rotated(rotation)


func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		add_random_bounce()
		
		ball_sfx_player.play()


func add_random_bounce() -> void:
	# Add random angle variation and test for x direction
	var starting_ball_direction = sign(velocity.x)
	var random_angle = deg_to_rad(randf_range(-10.0, 10.0))
	var new_velocity = velocity.rotated(random_angle)
	var new_ball_direction = sign(new_velocity.x)
	if new_ball_direction == starting_ball_direction:
		velocity = new_velocity


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
