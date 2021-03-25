extends RigidBody2D
class_name Enemy
signal playerDies

var thrust = Vector2()
var rotation_dir = 1
var power = 20 + randi() % 100

const WALK_SPEED = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	set_bounce(10.0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	patrol_square()
	pass

func patrol_square():
	$AnimationPlayer.play("Down")
	thrust = Vector2(power, 0)

func _on_RigidBody2D2_body_entered(body):
	print("body entered", body)
	if body is Player:
		print("player!")
		emit_signal("playerDies")

func _on_Timer_timeout():
	print("timep")
	rotation_dir += 1

func _integrate_forces(state):
	set_applied_force(thrust.rotated(rotation))
	set_applied_torque(rotation_dir * 1500 * randi() % 200)
	pass
