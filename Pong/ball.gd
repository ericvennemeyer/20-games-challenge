class_name Ball
extends CharacterBody2D

const SPEED = 300.0


func start(_position, _direction) -> void:
	rotation_degrees = _direction
	position = _position
	velocity = Vector2(SPEED, 0).rotated(rotation_degrees)


func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
