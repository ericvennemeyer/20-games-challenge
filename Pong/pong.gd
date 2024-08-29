extends Node2D


func _ready() -> void:
	RenderingServer.set_default_clear_color(Color.BLACK)


func _draw() -> void:
	draw_dashed_line(Vector2(480, 56), Vector2(480, 536), Color.WHITE, 5.0, 10.0)
