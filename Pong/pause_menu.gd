extends CanvasLayer

@export_file("*.tscn") var pong_main_menu: String
@export_file("*.tscn") var twenty_games_main_menu: String

@onready var resume_button: Button = $MarginContainer/VBoxContainer/ResumeButton
@onready var current_rally_count: Label = $MarginContainer/VBoxContainer/CurrentRallyCount
@onready var longest_rally_count: Label = $MarginContainer/VBoxContainer/LongestRallyCount


func _ready() -> void:
	hide()


func pause_game(curr_rally: int, longest_rally: int) -> void:
	get_tree().paused = true
	show()
	resume_button.grab_focus()
	
	# Update rally counts in pause menu
	current_rally_count.text = "THIS RALLY: " + str(curr_rally)
	longest_rally_count.text = "LONGEST RALLY: " + str(longest_rally)


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
	unpause_game()
	get_tree().change_scene_to_file(twenty_games_main_menu)


func _on_resume_button_gui_input(event: InputEvent) -> void:
	GlobalPong.play_ui_sfx(event)


func _on_new_game_button_gui_input(event: InputEvent) -> void:
	GlobalPong.play_ui_sfx(event)


func _on_menu_button_gui_input(event: InputEvent) -> void:
	GlobalPong.play_ui_sfx(event)


func _on_quit_button_gui_input(event: InputEvent) -> void:
	GlobalPong.play_ui_sfx(event)
