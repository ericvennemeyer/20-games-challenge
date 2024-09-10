class_name Ball
extends CharacterBody2D

signal collided_with_paddle

const SPEED = 500.0

var last_collision = null
var this_collision = null

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
		
		# Add to rally count if ball hits a paddle
		last_collision = this_collision
		this_collision = collision.get_collider()
		if this_collision.has_method("check_ball_moving_toward_player") and this_collision != last_collision:
			collided_with_paddle.emit()
		
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
