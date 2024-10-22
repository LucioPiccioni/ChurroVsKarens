extends CharacterBody2D
@export var speed = 200
@export var cell = 32
@onready var robertito: AnimatedSprite2D = $AnimatedSprite2D
@onready var direction = Vector2.RIGHT
##GODOT 3 TO 4 MIGRATION CHANGES EXPLAINED:
 #In GD4, there's a new variable called velocity in every CharacterBody2D node...
 #So instead of defining my own new velocity variable, I simply modify that one.
 #The move_and_slide function doesn't take a parameter in GD4,
 #it now works hand in hand with that velocity variable.
func _physics_process(delta):
	var userButton = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if robertito.is_in_group("Enemy"):
		GlobalScore.life -= 1
	if userButton:
		direction = userButton
	if direction:
		velocity = direction * speed 
		
	if userButton.x < 0:
		robertito.scale.x = -abs(robertito.scale.x)  # Mira a la izquierda
	elif userButton.x > 0:
		robertito.scale.x = abs(robertito.scale.x)   # Mira a la derecha
	
	check_teleport()
	
	
	if move_and_slide():
		if GlobalScore.life > 0:
			robertito.animation = "idle"
	else:
		if GlobalScore.life > 0:
			robertito.animation = "walk"
	if GlobalScore.life <= 0:
		robertito.animation = "death"

func check_teleport():
	#FIXME ESTO ESTA HARCODEADO HASTA QUE MUEVAN EL MAPA Y LO ACOMODEN!
	var init = 176
	var finish = 976
	if global_position.x < init:
		global_position.x = finish
	elif global_position.x > finish:
		global_position.x = init
