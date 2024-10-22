extends Sprite2D

static var churro_count = 0

func _init() -> void:
	churro_count += 1
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		GlobalScore.score += 1
		queue_free()
		
