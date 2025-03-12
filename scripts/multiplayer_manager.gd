extends Node

var peer = ENetMultiplayerPeer.new()

var port = 7777
@export var player_scene : PackedScene

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("1"):
		join_server()
	elif Input.is_action_just_pressed("2"):
		create_server()

func create_server():
	peer.create_server(port)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_add_player)
	_add_player()

func join_server():
	peer.create_client("localhost",port)
	multiplayer.multiplayer_peer = peer

func _add_player(id = 1):
	var player = player_scene.instantiate()
	player.name = str(id)
	get_parent().call_deferred("add_child", player)
