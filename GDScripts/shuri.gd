extends CharacterBody2D

@export var speed = 300
@onready var ThrowPoint = $ThrowPoint
@onready var body = $CollisionShape2D

func _input(event: InputEvent):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		fire_projectile()

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed

func fire_projectile():
	var projectile_scene = preload("res://Shuri/Shuriken.tscn")
	var projectile = projectile_scene.instantiate()
	var mouse_position = get_global_mouse_position()
	var direction = (mouse_position - body.global_position).normalized()
	projectile.set_velocity(direction * 500)
	ThrowPoint.global_position = body.global_position + 45 * direction
	projectile.position = ThrowPoint.global_position
	projectile.rotation = direction.angle()
	get_tree().current_scene.add_child(projectile)
	projectile.kill(false)

func _physics_process(delta):
	get_input()
	move_and_slide()
