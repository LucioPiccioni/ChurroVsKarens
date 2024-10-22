extends Control
const Churro = preload("res://churro.gd")

func _on_play_pressed():
	GlobalScore.score = 0
	GlobalScore.life = 3
	Churro.churro_count = 0
	get_tree().change_scene_to_file("res://world.tscn")

func _on_options_pressed():
	get_tree().change_scene_to_file("res://options.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _on_credits_pressed():
	get_tree().change_scene_to_file("res://credits.tscn")
