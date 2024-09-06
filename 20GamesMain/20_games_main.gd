extends Control

@export_file("*.tscn") var pong_game: String

@onready var tv_20_games_title: Control = $TV20GamesTitle
@onready var tv_settings_screen: Control = $TVSettingsScreen

@onready var settings_back_button: Button = $TVSettingsScreen/SettingsBackButton

@onready var pong_button: Button = $GameMenu/VBoxContainer/PongButton


func _ready() -> void:
	tv_20_games_title.show()
	tv_settings_screen.hide()
	
	pong_button.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass


func _on_pong_button_pressed() -> void:
	get_tree().change_scene_to_file(pong_game)


func _on_settings_button_pressed() -> void:
	tv_20_games_title.hide()
	tv_settings_screen.show()
	settings_back_button.grab_focus()


func _on_credits_button_pressed() -> void:
	pass # Replace with function body.


func _on_about_button_pressed() -> void:
	pass # Replace with function body.


func _on_settings_back_button_pressed() -> void:
	tv_20_games_title.show()
	tv_settings_screen.hide()
	
	pong_button.grab_focus()
