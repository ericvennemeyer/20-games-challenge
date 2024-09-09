extends Node

@export var main_ui_focus_sfx: AudioStream
@export var main_ui_accept_sfx: AudioStream
@export var tv_ui_focus_sfx: AudioStream
@export var tv_ui_accept_sfx: AudioStream
@export var tv_futz_sfx: AudioStream


func _ready() -> void:
	pass # Replace with function body.


func play_ui_sfx(event: InputEvent) -> void:
	var current_sfx: AudioStream
	
	if event.is_action_pressed("ui_up") or event.is_action_pressed("ui_down"):
		current_sfx = main_ui_focus_sfx
	elif event.is_action_pressed("ui_accept"):
		current_sfx = main_ui_accept_sfx
	
	var asp = AudioStreamPlayer.new()
	asp.stream = current_sfx
	asp.bus = "SFX"
	asp.name = "SFX"
	
	add_child(asp)
	asp.play()
	await asp.finished
	asp.queue_free()
