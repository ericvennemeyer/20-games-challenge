extends Control

@export_file("*.tscn") var game_scene: String

@onready var play_button: Button = $VBoxContainer/Play_Button


func _ready() -> void:
	RenderingServer.set_default_clear_color(Color.BLACK)
	play_button.grab_focus()


func _on_p_1_option_button_item_selected(index: int) -> void:
	GlobalPong.set_player_type("p1", index)


func _on_p_2_option_button_item_selected(index: int) -> void:
	GlobalPong.set_player_type("p2", index)


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file(game_scene)


func _on_quit_button_pressed() -> void:
	pass # Replace with function body.
