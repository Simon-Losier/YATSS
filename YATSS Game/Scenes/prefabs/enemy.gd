extends CharacterBody3D

signal dead

@export var health: float = 3
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	move_and_slide()

func take_damage(amount: float):
	health = health - amount
	$HitSound.play
	if health <= 0:
		dead.emit()
		queue_free()

func _on_area_3d_body_entered(body: Node3D):
	take_damage(1)
