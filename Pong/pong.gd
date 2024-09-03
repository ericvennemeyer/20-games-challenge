extends Node2D

var ball = preload("res://Pong/ball.tscn")
var ball_position: Vector2
var ball_direction: int

@onready var victory_sfx_player: AudioStreamPlayer = $VictorySFXPlayer
@onready var next_ball_timer: Timer = $NextBallTimer


func _ready() -> void:
	RenderingServer.set_default_clear_color(Color.BLACK)
	start_game()


func _draw() -> void:
	draw_dashed_line(Vector2(480, 56), Vector2(480, 536), Color.WHITE, 5.0, 10.0)


func start_game() -> void:
	randomize_ball_params()
	spawn_ball()


func randomize_ball_params():
	var random = RandomNumberGenerator.new()
	random.randomize()
	ball_position = Vector2(480, randi_range(80, 512))
	ball_direction = randi_range(0, 360)


func spawn_ball() -> void:
	var new_ball = ball.instantiate()
	new_ball.start(ball_position, ball_direction)
	get_tree().root.add_child.call_deferred(new_ball)


func _on_score_board_point_scored(_losing_player: String) -> void:
	next_ball_timer.start()
	victory_sfx_player.play()


func _on_next_ball_timer_timeout() -> void:
	start_game()
