class_name Ball
extends CharacterBody2D

const SPEED = 400.0

@onready var ball_sfx_player: AudioStreamPlayer = $BallSFXPlayer


func start(_position, _direction) -> void:
	rotation = deg_to_rad(_direction)
	position = _position
	velocity = Vector2(SPEED, 0).rotated(rotation)
	print(velocity)


func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		
		ball_sfx_player.play()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
