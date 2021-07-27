extends Area2D

signal on_collect
export var coin_value = 1
class_name Coin
func _ready():
	pass # Replace with function body.

func _on_Coin_body_entered(body):
	emit_signal("on_collect",coin_value)
	queue_free()
