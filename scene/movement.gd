extends CharacterBody2D
class_name PlayerController

@export var speed = 20.0

var diraction : Vector2


func _physics_process(delta) :
	if Input.is_action_pressed("move_up"):
		diraction.y = -1
	elif Input.is_action_pressed("move_down"):
		diraction.y = 1
	else: diraction.y = 0
	
	if Input.is_action_pressed("move_right"):
		diraction.x = 1
	elif Input.is_action_pressed("move_left"):
		diraction.x = -1
	else: diraction.x = 0
	
	velocity = diraction * speed * delta * 200
	
	move_and_slide()
