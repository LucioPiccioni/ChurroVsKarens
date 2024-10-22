extends CharacterBody2D

const speed = 100
@onready var zombie: AnimatedSprite2D = $AnimatedSprite2D
@export var player: Node2D
@onready var navigation_agent_2d := $NavigationAgent2D as NavigationAgent2D

var MovingDown = false
var MovingUp = false
var MovingRight = false
var MovingLeft = false

func _ready() -> void:
	makepath()

func _physics_process(delta: float) -> void:
	var dir = to_local(navigation_agent_2d.get_next_path_position()).normalized()
	velocity = dir * speed
	move_and_slide()
	
	MovingUp = dir.y < 0
	MovingDown = dir.y > 0
	MovingRight = dir.x > 0
	MovingLeft = dir.x < 0
	
	if velocity.length() > 0:  # Solo verificar si se está moviendo
		if MovingUp && !MovingRight || !MovingLeft:
				#print("Moviendo hacia arriba")
				zombie.animation = "walk_Up"
		elif MovingDown && !MovingRight || !MovingLeft:
			#print("Moviendo hacia abajo") 
			zombie.animation = "walk_Down"
		if MovingRight:
			#print("Moviendo a la derecha")
			zombie.animation = "walk_Right"
		elif MovingLeft:
			#print("Moviendo a la izquierda")
			zombie.animation = "walk_Left"
		else:
			#print("El zombie está quieto")
			zombie.animation = "idle_Up"

func makepath() -> void:
	navigation_agent_2d.target_position = player.global_position

func _on_timer_timeout() -> void:
	makepath() # Replace with function body.


func _on_sword_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		GlobalScore.hit_player()
