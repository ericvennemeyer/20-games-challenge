extends Node

@onready var ui_move_sfx: AudioStream = preload("res://Pong/Assets/Audio/Classic Old School 8 Bit Retro Game -User Interface Interaction - Jump, Take Off, Rise, Lift Up - 01    [005080].wav")
@onready var ui_select_sfx: AudioStream = preload("res://Pong/Assets/Audio/Future_Button_9.wav")


# For player type, 0 = human and 1 = computer
var players = {"p1": 0,
			   "p2": 0}


func _ready() -> void:
	pass # Replace with function body.


func set_player_type(player: String, player_type: int) -> void:
	players[player] = player_type


func get_player_type(player: String):
	return players[player]


func play_ui_sfx(event: InputEvent) -> void:
	var audio: AudioStream
	
	if event.is_action_pressed("ui_up") or event.is_action_pressed("ui_down"):
		audio = ui_move_sfx
	elif event.is_action_pressed("ui_accept"):
		audio = ui_select_sfx
	
	var asp = AudioStreamPlayer.new()
	asp.stream = audio
	asp.bus = "SFX"
	asp.name = "SFX"
	
	add_child(asp)
	asp.play()
	await asp.finished
	asp.queue_free()
