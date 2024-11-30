extends CharacterBody2D

@onready var base: AnimatedSprite2D = %Base
@onready var weapon: AnimatedSprite2D = %Weapon
@onready var rocket_scene := preload('res://Rocket/rocket.tscn')

var direction
var direction_angle
var move_direction = Vector2.RIGHT
var accelerate := 100.0
var max_speed := 180.0
var current_rotation := 90.0
var rate_of_fire := 1.0
var timer := 1.0 # чтобы в начале игры не было задержки

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	direction_angle = rad_to_deg(direction.angle()) + 90.0
	if direction != Vector2.ZERO:
		move_direction = direction
	
	if velocity.length() >= max_speed:
		velocity = velocity.normalized() * max_speed
	
	if direction == Vector2.ZERO:
		velocity = Vector2.ZERO
	
	velocity.x = move_toward(velocity.x, max_speed * direction.x, accelerate)
	velocity.y = move_toward(velocity.y, max_speed * direction.y, accelerate)
	velocity += direction * accelerate * delta
	move_and_slide()
	set_dir_and_anim()
	timer += delta


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("shot") and timer >= rate_of_fire:
		weapon.play('shot')
		launch_rocket(move_direction)
		timer = 0.0


func set_dir_and_anim():
	if direction != Vector2.ZERO:
		rotation_degrees = direction_angle
		current_rotation = direction_angle
		base.play('move')
	else:
		rotation_degrees = current_rotation
		base.play('idle')


func launch_rocket(_to: Vector2):
	var rocket_instance = rocket_scene.instantiate()
	owner.add_child(rocket_instance)
	rocket_instance.global_position = %MarkerForRocket.global_position
	rocket_instance.set_direction(_to)
