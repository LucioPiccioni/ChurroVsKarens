extends CharacterBody2D

const speed = 100

@export var player: Node2D
@onready var navigation_agent_2d := $NavigationAgent2D as NavigationAgent2D

func _ready() -> void:
	makepath()

func _physics_process(delta: float) -> void:
	var dir = to_local(navigation_agent_2d.get_next_path_position()).normalized()
	velocity = dir * speed
	move_and_slide()

func makepath() -> void:
	navigation_agent_2d.target_position = player.global_position

func _on_timer_timeout() -> void:
	makepath() # Replace with function body.
