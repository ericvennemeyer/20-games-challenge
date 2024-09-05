extends Control

@export var game_scene: PackedScene

@onready var play_button: Button = $VBoxContainer/Play_Button


func _ready() -> void:
	RenderingServer.set_default_clear_color(Color.BLACK)
	play_button.grab_focus()


func _on_p_1_option_button_item_selected(index: int) -> void:
	pass # Replace with function body.


func _on_p_2_option_button_item_selected(index: int) -> void:
	pass # Replace with function body.


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_packed(game_scene)


func _on_quit_button_pressed() -> void:
	pass # Replace with function body.
