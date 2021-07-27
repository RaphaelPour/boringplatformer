extends Area2D

signal on_collect
export var coin_value = 1
class_name Coin
func _ready():
	pass # Replace with function body.

func _on_Coin_body_entered(body):
	
	# make coin invisible to avoid latency
	self.visible = false
	
	# Free object after the sound has finished. Otherwise only a short
	# snipped of the sound will get played.
	$AudioStreamPlayer.connect("finished",self, "queue_free")
	emit_signal("on_collect",coin_value)
	$AudioStreamPlayer.play()
