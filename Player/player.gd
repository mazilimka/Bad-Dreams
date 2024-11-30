extends CharacterBody2D

@onready var base: AnimatedSprite2D = %Base
@onready var weapon: AnimatedSprite2D = %Weapon
@onready var rocket_scene := preload('res://Rocket/rocket.tscn')

var direction
var direction_angle
var move_direction := 1.0
var accelerate := 100.0
var max_speed := 300.0
var current_rotation := 90.0
var rate_of_fire := 1
var timer := 0.0
var center_screen := Vector2(800 / 2, 600 / 2)

func _physics_process(delta: float) -> void:
	direction = Input.get_axis("move_left", "move_right")
	if direction != 0.0:
		move_direction = direction
	
	if velocity.length() >= max_speed:
		velocity = velocity.normalized() * max_speed
	
	if direction == 0.0:
		velocity.x = 0.0
	
	if direction == 1:
		direction_angle = 90
	elif direction == -1:
		direction_angle = -90
	
	velocity.x = move_toward(velocity.x, max_speed * direction, accelerate)
	velocity.x += direction * accelerate * delta
	move_and_slide()
	set_dir_and_anim()
	
	timer += delta
	if timer >= rate_of_fire:
		weapon.play('shot')
		launch_rocket(move_direction)
		timer = 0.0


func set_dir_and_anim():
	if direction != 0.0:
		rotation_degrees = direction_angle
		current_rotation = direction_angle
		base.play('move')
	else:
		rotation_degrees = current_rotation
		base.play('idle')


func launch_rocket(_to: float):
	var rocket_instance = rocket_scene.instantiate()
	owner.add_child(rocket_instance)
	rocket_instance.global_position = %MarkerForRocket.global_position
	rocket_instance.set_direction(_to)
