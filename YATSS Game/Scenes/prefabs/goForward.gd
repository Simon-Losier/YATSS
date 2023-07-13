extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	add_constant_force(Vector3.RIGHT * 30)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
