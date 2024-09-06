extends CanvasLayer

@export_file("*.tscn") var pong_main_menu: String

@onready var resume_button: Button = $MarginContainer/VBoxContainer/ResumeButton


func _ready() -> void:
	hide()


func pause_game() -> void:
	get_tree().paused = true
	show()
	resume_button.grab_focus()


func unpause_game() -> void:
	get_tree().paused = false
	hide()


func _on_resume_button_pressed() -> void:
	unpause_game()


func _on_new_game_button_pressed() -> void:
	unpause_game()
	get_tree().reload_current_scene()


func _on_menu_button_pressed() -> void:
	unpause_game()
	get_tree().change_scene_to_file(pong_main_menu)


func _on_quit_button_pressed() -> void:
	pass # Replace with function body.


func _on_resume_button_gui_input(event: InputEvent) -> void:
	GlobalPong.play_ui_sfx(event)


func _on_new_game_button_gui_input(event: InputEvent) -> void:
	GlobalPong.play_ui_sfx(event)


func _on_menu_button_gui_input(event: InputEvent) -> void:
	GlobalPong.play_ui_sfx(event)


func _on_quit_button_gui_input(event: InputEvent) -> void:
	GlobalPong.play_ui_sfx(event)
