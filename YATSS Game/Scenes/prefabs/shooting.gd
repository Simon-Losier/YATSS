extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("shoot_up"):
		shoot()
	if Input.is_action_just_pressed("shoot_down"):
		shoot()
	if Input.is_action_just_pressed("shoot_left"):
		shoot()
	if Input.is_action_just_pressed("shoot_right"):
		shoot()
		
func shoot():
	# Shoot projectile
	var prefab = load("res://Scenes/prefabs/Projectile.tscn")
	var scene_instance = prefab.instantiate()
	scene_instance.set_name("projectile")
	add_child(scene_instance)
