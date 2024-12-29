extends CharacterBody2D

func _physics_process(delta):
	move_and_slide()

func kill(empowered: bool):
	for i in range(10):
		await get_tree().create_timer(0.1).timeout
	queue_free()
