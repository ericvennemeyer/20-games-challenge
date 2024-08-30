extends CanvasLayer

signal point_scored(losing_player: String)

var p1_score: int = 0
var p2_score: int = 0

@onready var p1_score_label: Label = $P1ScoreLabel
@onready var p2_score_label: Label = $P2ScoreLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_score()


func update_score() -> void:
	p1_score_label.text = str(p1_score)
	p2_score_label.text = str(p2_score)


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
