extends CanvasLayer

signal point_scored(losing_player: String)

var p1_score: int = 0
var p2_score: int = 0

@onready var p_1_label: Label = $P1Label
@onready var p_2_label: Label = $P2Label
@onready var p1_score_label: Label = $P1ScoreLabel
@onready var p2_score_label: Label = $P2ScoreLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_score()
	update_player_labels()


func update_score() -> void:
	p1_score_label.text = str(p1_score)
	p2_score_label.text = str(p2_score)


func update_player_labels() -> void:
	# Get player types (human/computer)
	var p1 = GlobalPong.get_player_type("p1")
	var p2 = GlobalPong.get_player_type("p2")
	# Set label text for P1
	if p1 == 0:
		p_1_label.text = "P1: HUMAN"
	else:
		p_1_label.text = "P1: COMPUTER"
	# Set label text for P2
	if p2 == 0:
		p_2_label.text = "P2: HUMAN"
	else:
		p_2_label.text = "P2: COMPUTER"


func _on_p_1_goal_area_body_entered(body: Node2D) -> void:
	if body is Ball:
		p2_score += 1
		update_score()
		point_scored.emit("player1")


func _on_p_2_goal_area_body_entered(body: Node2D) -> void:
	if body is Ball:
		p1_score += 1
		update_score()
		point_scored.emit("player2")
