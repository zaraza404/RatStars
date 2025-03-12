extends CharacterBody2D

var speed = 100

func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int())
	if is_multiplayer_authority():
		$Camera2D.enabled = true

func _physics_process(delta: float) -> void:
	if is_multiplayer_authority():
		velocity = Input.get_vector("left","right", "up", "down")  * speed
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	move_and_slide()
