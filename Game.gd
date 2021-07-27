extends Node2D

var coins = 0

func _ready():
	for coin in get_tree().get_nodes_in_group("coins"):
		coin.connect("on_collect", self, "on_coin_collected")

func on_coin_collected(value):
	coins += value
