extends CharacterBody2D

const SPEED = 300.0

@export_enum("player1", "player2", "computer") var player: String

var paddle_up: String
var paddle_down: String
var computer_offensive_speed: float
var computer_defensive_speed: float
var last_ball_distance: float
var current_ball_distance: float
var ball: Ball


func _ready() -> void:
	match player:
		"player1":
			paddle_up = "P1_paddle_up"
			paddle_down = "P1_paddle_down"
		"player2":
			paddle_up = "P2_paddle_up"
			paddle_down = "P2_paddle_down"
		"computer":
			create_computer_opponent()
		_:
			print("No player type selected for this paddle.")


func _physics_process(_delta: float) -> void:
	if player == "computer":
		if is_instance_valid(ball):
			var direction = position.direction_to(ball.position)
			last_ball_distance = current_ball_distance
			current_ball_distance = position.distance_to(ball.position)
			if current_ball_distance < last_ball_distance:
				velocity.y = direction.y * computer_offensive_speed
			else:
				velocity.y = direction.y * computer_defensive_speed
		else:
			velocity.y = move_toward(velocity.y, 0, computer_defensive_speed)
	else:
		# Get the input direction and handle the movement/deceleration.
		var direction := Input.get_axis(paddle_up, paddle_down)
		if direction:
			velocity.y = direction * SPEED
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()


func create_computer_opponent() -> void:
	var random = RandomNumberGenerator.new()
	random.randomize()
	computer_offensive_speed = randf_range(280.0, 360.0)
	computer_defensive_speed = computer_offensive_speed * randf_range(0, .6)
	print("Offensive speed: " + str(computer_offensive_speed) + 
		", Defensive speed: " + str(computer_defensive_speed))


func update_ball_reference(_ball: Ball) -> void:
	ball = _ball
	
	# Re-randomize computer opponent speed stats after each point
	if player == "computer":
		create_computer_opponent()
