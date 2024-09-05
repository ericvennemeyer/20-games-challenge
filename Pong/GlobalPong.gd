extends Node

# For player type, 0 = human and 1 = computer
var players = {"p1": 0,
			   "p2": 0}


func _ready() -> void:
	pass # Replace with function body.


func set_player_type(player: String, player_type: int) -> void:
	players[player] = player_type


func get_player_type(player: String):
	return players[player]
