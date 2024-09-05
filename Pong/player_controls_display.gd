extends Control

@export_file("*.tscn") var game_scene: String


func _ready() -> void:
	RenderingServer.set_default_clear_color(Color.BLACK)


func _process(delta: float) -> void:
	if Input.is_anything_pressed():
		get_tree().change_scene_to_file(game_scene)
