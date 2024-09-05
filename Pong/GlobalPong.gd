extends Node

var players = {"p1": "human",
			   "p2": "human"}


func _ready() -> void:
	pass # Replace with function body.


func set_player_type(player: String, player_type: String) -> void:
	players[player] = player_type


func get_player_type(player: String):
	return players[player]
