@tool
extends Area2D
var canKill = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# It's easier to create a CollisionPolygon2D hitbox on the fly that matches the Polygon2D's points.
	# When the game starts, this code will run and add a CollisionPolygon2D child to the land.
	if not Engine.is_editor_hint():
		var coll := CollisionPolygon2D.new()
		coll.name = "Collision"
		coll.polygon = $Polygon2D.polygon # Copies the polygon points
		coll.global_position = $Polygon2D.global_position
		coll.scale = $Polygon2D.scale
		add_child(coll)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# To allow the outline to update whenever we update the polygon in the editor, this code is here.
	# It'll assign the polygon's points to the outline so it can mimic the shape of the polygon.
	if Engine.is_editor_hint():
		$Line2D.global_position = $Polygon2D.global_position
		$Line2D.scale = $Polygon2D.scale
		var points := PackedVector2Array($Polygon2D.polygon)
		points.append($Polygon2D.polygon[0]) # We want to complete the outline so we add the first point to the end
		$Line2D.points = points



func _on_body_entered(body):
	if body.name == "Player":
		var _target = get_tree().change_scene_to_file("res://Levels/Lost.tscn")


func _on_timer_timeout():
	$Timer.start()
	if canKill:
		canKill = false
		$Polygon2D.hide()
		$Line2D.hide()
		$Collision.disabled = true
	else:
		canKill = true
		$Polygon2D.show()
		$Line2D.show()
		$Collision.disabled = false
		
