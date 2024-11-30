extends CharacterBody2D

@onready var base: AnimatedSprite2D = %Base
@onready var weapon: AnimatedSprite2D = %Weapon

var direction
var accelerate := 100.0
var max_speed := 180.0
var current_rotation := 90.0

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	
	if velocity.length() >= max_speed:
		print('current speed == max')
		velocity = velocity.normalized() * max_speed
	
	if direction == Vector2.ZERO:
		velocity = Vector2.ZERO
	
	velocity.x = move_toward(velocity.x, max_speed * direction.x, accelerate)
	velocity.y = move_toward(velocity.y, max_speed * direction.y, accelerate)
	velocity += direction * accelerate * delta
	move_and_slide()
	set_dir_and_anim()


func set_dir_and_anim():
	if direction != Vector2.ZERO:
		rotation_degrees = rad_to_deg(direction.angle()) + 90.0
		current_rotation = rotation_degrees
		base.play('move')
	else:
		rotation_degrees = current_rotation
		base.play('idle')
