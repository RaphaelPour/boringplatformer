extends Node2D

func _ready():
	for coin in get_tree().get_nodes_in_group("coins"):
		coin.connect("on_collect", self, "on_coin_collected")

func on_coin_collected(value):
	$Player.add_coins()
