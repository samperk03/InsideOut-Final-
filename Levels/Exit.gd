extends Area2D


func _on_body_entered(body):
	if body.name == "Player":
		if name == "Exit_to_1":
			var _target = get_tree().change_scene_to_file("res://Levels/Level1.tscn")
		if name == "Exit_to_2":
			var _target = get_tree().change_scene_to_file("res://Levels/level2.tscn")
		if name == "Exit_to_3":
			var _target = get_tree().change_scene_to_file("res://Levels/Game_Over.tscn")
		if name == "Exit_to_Lost":
			var _target = get_tree().change_scene_to_file("res://Levels/Game_Over.tscn")
		if name == "Exit_to_Lost2":
			var _target = get_tree().change_scene_to_file("res://Levels/Game_Over.tscn")
