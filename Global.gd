extends Node


var coins = 0
var soundtime = 0



func add_coin():
	coins += 1
	var Coins = get_node_or_null("/root/Game/UI/HUD/Coins")
	if Coins != null:
		Coins.text = "Coins: " + str(coins)



