extends Node2D

var ball = preload("res://Pong/ball.tscn")
var ball_position: Vector2
var ball_direction: int
var spawned_ball
var losing_player
var current_rally_count: int = 0
var longest_rally_count: int = 0
var countdown_timer_count: int = 0

@onready var victory_sfx_player: AudioStreamPlayer = $VictorySFXPlayer
@onready var countdown_sfx_player: AudioStreamPlayer = $CountdownSFXPlayer
@onready var spawn_ball_sfx_player: AudioStreamPlayer = $SpawnBallSFXPlayer
@onready var pause_sfx_player: AudioStreamPlayer = $PauseSFXPlayer
@onready var countdown_timer: Timer = $CountdownTimer
@onready var next_ball_timer: Timer = $NextBallTimer
@onready var pause_menu: CanvasLayer = $PauseMenu


func _ready() -> void:
	RenderingServer.set_default_clear_color(Color.BLACK)
	play_countdown()


func _draw() -> void:
	draw_dashed_line(Vector2(480, 56), Vector2(480, 536), Color.WHITE, 5.0, 10.0)


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("new_ball") and is_instance_valid(spawned_ball):
		spawned_ball.queue_free()
		start_game()
	elif Input.is_action_just_pressed("pause"):
		pause_sfx_player.play()
		pause_menu.pause_game(current_rally_count, longest_rally_count)


func play_countdown() -> void:
	countdown_sfx_player.play()
	countdown_timer.start()


func _on_countdown_timer_timeout() -> void:
	if countdown_timer_count < 2:
		countdown_sfx_player.play()
		countdown_timer_count += 1
	else:
		countdown_timer.stop()
		countdown_timer_count = 0
		start_game()


func start_game() -> void:
	current_rally_count = 0
	randomize_ball_params()
	spawn_ball()


func randomize_ball_params():
	var random = RandomNumberGenerator.new()
	random.randomize()
	ball_position = Vector2(480, randi_range(80, 512))
	match losing_player:
		"player1":
			ball_direction = randi_range(90, 270)
		"player2":
			ball_direction = randi_range(-90, 90)
		_:
			ball_direction = randi_range(0, 359)


func spawn_ball() -> void:
	var new_ball = ball.instantiate()
	new_ball.collided_with_paddle.connect(on_ball_collided_with_paddle)
	spawned_ball = new_ball
	new_ball.start(ball_position, ball_direction)
	add_child.call_deferred(new_ball)
	update_paddle_reference_to_ball(new_ball)
	spawn_ball_sfx_player.play()


func update_paddle_reference_to_ball(_ball: Ball) -> void:
	get_tree().call_group("paddles", "update_ball_reference", _ball)


func _on_score_board_point_scored(_losing_player: String) -> void:
	losing_player = _losing_player
	next_ball_timer.start()
	victory_sfx_player.play()


func _on_next_ball_timer_timeout() -> void:
	start_game()


func on_ball_collided_with_paddle() -> void:
	current_rally_count += 1
	if current_rally_count > longest_rally_count:
		longest_rally_count = current_rally_count
