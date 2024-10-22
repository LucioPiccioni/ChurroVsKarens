extends Node

var score = 0
var life = 3

func hit_player():
	if life <= 0:
		print("perdiste")
	else:
		life -= 1
