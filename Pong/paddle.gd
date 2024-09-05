extends CharacterBody2D

const SPEED = 300.0

@export_enum("player1", "player2") var player: String

var player_type: int

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
			player_type = GlobalPong.get_player_type("p1")
		"player2":
			paddle_up = "P2_paddle_up"
			paddle_down = "P2_paddle_down"
			player_type = GlobalPong.get_player_type("p2")
		_:
			print("No player type selected for this paddle.")


func _physics_process(_delta: float) -> void:
	# Check if player type is 1, i.e. "computer"
	if player_type == 1:
		if is_instance_valid(ball):
			var direction = position.direction_to(ball.position)
			if check_ball_moving_toward_player():
				velocity.y = direction.y * computer_offensive_speed
			else:
				velocity.y = direction.y * computer_defensive_speed
		else:
			velocity.y = move_toward(velocity.y, 0, computer_defensive_speed)
	# Else player type is 0, i.e. "human"
	else:
		# Get the input direction and handle the movement/deceleration.
		var direction := Input.get_axis(paddle_up, paddle_down)
		if direction:
			velocity.y = direction * SPEED
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()


func check_ball_moving_toward_player():
	last_ball_distance = current_ball_distance
	current_ball_distance = position.distance_to(ball.position)
	if current_ball_distance < last_ball_distance:
		return true
	else:
		return false


func create_computer_opponent() -> void:
	var random = RandomNumberGenerator.new()
	random.randomize()
	computer_offensive_speed = randf_range(300.0, 420.0)
	computer_defensive_speed = computer_offensive_speed * randf_range(0, 1)
	print("Offensive speed: " + str(computer_offensive_speed) + 
		", Defensive speed: " + str(computer_defensive_speed))


func update_ball_reference(_ball: Ball) -> void:
	ball = _ball
	# If player is computer, randomize computer opponent speed stats after each point
	if player_type == 1:
		create_computer_opponent()
