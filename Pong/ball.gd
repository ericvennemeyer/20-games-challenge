extends CharacterBody2D


const SPEED = 300.0


func _ready() -> void:
	var random = RandomNumberGenerator.new()
	random.randomize()
	var _position = Vector2(480, randi_range(80, 512))
	var _direction = randi_range(0, 360)
	start(_position, _direction)


func start(_position, _direction) -> void:
	rotation_degrees = _direction
	position = _position
	velocity = Vector2(SPEED, 0).rotated(rotation_degrees)


func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
