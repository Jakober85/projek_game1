
extends Area2D

@export var target_position: Vector2
@export var cam_limit_left: int
@export var cam_limit_right: int
@export var cam_limit_top: int
@export var cam_limit_bottom: int

func _on_body_entered(body):
	if body.name == "Player":
		# pindahin player
		body.position = target_position 

		# ambil kamera dari player
		var cam = body.get_node("Camera2D")
		cam.limit_left = cam_limit_left
		cam.limit_right = cam_limit_right
		cam.limit_top = cam_limit_top
		cam.limit_bottom = cam_limit_bottom
