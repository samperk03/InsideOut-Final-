extends AudioStreamPlayer2D

func _on_finished():
	play()

func _ready():
	seek(Global.soundtime)
