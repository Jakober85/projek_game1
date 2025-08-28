extends CharacterBody2D

@export var speed: float = 100.0
var last_vertical_dir = "front" # "front" atau "back"

func _physics_process(delta):
	var input_vector = Vector2.ZERO

	# Input arah vertikal
	if Input.is_action_pressed("ui_up"):
		input_vector.y = -1
		last_vertical_dir = "back"
	elif Input.is_action_pressed("ui_down"):
		input_vector.y = 1
		last_vertical_dir = "front"

	# Input arah horizontal
	if Input.is_action_pressed("ui_left"):
		input_vector.x = -1
	elif Input.is_action_pressed("ui_right"):
		input_vector.x = 1

	input_vector = input_vector.normalized()
	velocity = input_vector * speed
	move_and_slide()

	# Ambil node AnimatedSprite2D (karena dia anak langsung CharacterBody2D)
	var sprite = $AnimatedSprite2D

	# Animasi
	if input_vector != Vector2.ZERO:
		if input_vector.y < 0:
			sprite.play("back")
		elif input_vector.y > 0:
			sprite.play("front")
		else:
			sprite.play(last_vertical_dir)
	else:
		sprite.stop()
		sprite.frame = 0
