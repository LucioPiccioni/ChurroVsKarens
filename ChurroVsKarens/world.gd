extends Node
@onready var score: Label = $Score
const Churro = preload("res://churro.gd")

var churro_max = 0 
var win = false
var lose = false

func _process(delta: float) -> void:
	#print(churro_max)
	churro_max = Churro.churro_count
	score.text = str(GlobalScore.score)
	if GlobalScore.score == churro_max:
		#win!!!
		win = true
		get_tree().change_scene_to_file("res://GameOverScene.tscn")
	elif GlobalScore.life <= 0:
		lose = true
		get_tree().change_scene_to_file("res://GameOverScene.tscn")
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")
