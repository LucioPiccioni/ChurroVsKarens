extends Node
@onready var score: Label = $Score

func _process(delta: float) -> void:
	score.text = str(GlobalScore.score)
	
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")
