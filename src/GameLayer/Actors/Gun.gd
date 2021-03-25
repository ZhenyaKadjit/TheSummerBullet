class_name Gun
extends Position2D
signal enemyDied
# Represents a weapon that spawns and shoots bullets.
# The Cooldown timer controls the cooldown duration between shots.


const BULLET_VELOCITY = 1.0
const Bullet = preload("res://src/GameLayer/Objects/Bullet.tscn")

#onready var sound_shoot = $Shoot
onready var timer = $Cooldown


# This method is only called by Player.gd.
func shoot(vector: Vector2):
	print("vector")
	print(vector)
	if not timer.is_stopped():
		return
	timer.start()
	var bullet = Bullet.instance()
	bullet.global_position = global_position
	print(Input.get_property_list())
	if vector.x > -40 && vector.x < 40:
		if vector.y > 0:
			bullet.position.y += 30
		else:
			bullet.position.y -= 30
	elif vector.x > 0:
		bullet.position.x += 30
	else:
		bullet.position.x -= 30
	bullet.linear_velocity = Vector2(vector.x * BULLET_VELOCITY, vector.y * BULLET_VELOCITY) 
	bullet.set_as_toplevel(true)
	bullet.connect("enemyDies", self, "on_enemy_died")
	add_child(bullet)
	#sound_shoot.play()
	print("shoot")

func on_enemy_died():
	emit_signal("enemyDied")
