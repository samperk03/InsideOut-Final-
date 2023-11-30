extends CharacterBody2D


const speed = 150.0

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()


func _on_coin_collector_body_entered(body):
	if body.name == "Coins":
		body.get_coin(global_position)
