extends Node3D


@onready var rigidBody = $RigidBody3D
@export var shoot_speed: int = 25
func shoot(direction: String):
	var shoot_direction: Vector3 = Vector3.FORWARD
	if direction == "up":
		shoot_direction = Vector3.FORWARD
	if direction == "right":
		shoot_direction = Vector3.RIGHT
	if direction == "left":
		shoot_direction = Vector3.LEFT
	if direction == "down":
		shoot_direction = Vector3.BACK
	$RigidBody3D.add_constant_force(shoot_direction * shoot_speed)


func _on_timer_timeout():
	queue_free()


func _on_area_3d_body_entered(body):
	print("Ball hit")



func _on_area_3d_area_entered(area):
	print("Area hit")
	queue_free()
