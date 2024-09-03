extends CharacterBody2D


const SPEED = 300.0

@export_enum("player1", "player2", "computer") var player: String

var paddle_up: String
var paddle_down: String


func _ready() -> void:
	match player:
		"player1":
			paddle_up = "P1_paddle_up"
			paddle_down = "P1_paddle_down"
		"player2":
			paddle_up = "P2_paddle_up"
			paddle_down = "P2_paddle_down"
		"computer":
			pass
		_:
			print("No player type selected for this paddle.")


func _physics_process(_delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis(paddle_up, paddle_down)
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
