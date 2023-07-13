extends Node3D

func shoot(direction: String):
	# Shoot projectile
	var prefab = load("res://Scenes/prefabs/Projectile.tscn")
	var projectile = prefab.instantiate()
	projectile.set_name("projectile")
	projectile.shoot(direction)
	projectile.position = global_position
	get_tree().root.add_child(projectile)
