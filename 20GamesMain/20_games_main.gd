extends Control

@export_file("*.tscn") var pong_game: String

@onready var audio_manager: Node = $AudioManager

@onready var tv_20_games_title: Control = $TV20GamesTitle
@onready var tv_settings_screen: Control = $TVSettingsScreen
@onready var settings_back_button: Button = $TVSettingsScreen/SettingsBackButton
@onready var tv_credits_screen: Control = $TVCreditsScreen
@onready var credits_back_button: Button = $TVCreditsScreen/CreditsBackButton
@onready var tv_about_screen: Control = $TVAboutScreen
@onready var about_back_button: Button = $TVAboutScreen/AboutBackButton

@onready var pong_button: Button = $GameMenu/VBoxContainer/PongButton


func _ready() -> void:
	reset_tv_display()


func reset_tv_display() -> void:
	tv_20_games_title.show()
	tv_settings_screen.hide()
	tv_credits_screen.hide()
	tv_about_screen.hide()
	
	pong_button.grab_focus()


############################
### Game menu UI signals ###
############################

func _on_pong_button_pressed() -> void:
	get_tree().change_scene_to_file(pong_game)


func _on_settings_button_pressed() -> void:
	tv_20_games_title.hide()
	tv_settings_screen.show()
	settings_back_button.grab_focus()


func _on_credits_button_pressed() -> void:
	tv_20_games_title.hide()
	tv_credits_screen.show()
	credits_back_button.grab_focus()


func _on_about_button_pressed() -> void:
	tv_20_games_title.hide()
	tv_about_screen.show()
	about_back_button.grab_focus()


func _on_pong_button_gui_input(event: InputEvent) -> void:
	audio_manager.play_ui_sfx(event)


func _on_settings_button_gui_input(event: InputEvent) -> void:
	audio_manager.play_ui_sfx(event)


func _on_credits_button_gui_input(event: InputEvent) -> void:
	audio_manager.play_ui_sfx(event)


func _on_about_button_gui_input(event: InputEvent) -> void:
	audio_manager.play_ui_sfx(event)


############################
### TV menu UI signals #####
############################

func _on_settings_back_button_pressed() -> void:
	reset_tv_display()


func _on_settings_back_button_gui_input(event: InputEvent) -> void:
	audio_manager.play_ui_sfx(event)


func _on_credits_back_button_pressed() -> void:
	reset_tv_display()


func _on_credits_back_button_gui_input(event: InputEvent) -> void:
	audio_manager.play_ui_sfx(event)


func _on_about_back_button_pressed() -> void:
	reset_tv_display()


func _on_about_back_button_gui_input(event: InputEvent) -> void:
	audio_manager.play_ui_sfx(event)
