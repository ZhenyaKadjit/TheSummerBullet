extends RigidBody2D
class_name Enemy
signal playerDies

enum LifeState {
	ALIVE,
	DEAD,
}
var state = LifeState.ALIVE
var velocity = Vector2()

const WALK_SPEED = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_RigidBody2D2_body_entered(body):
	print("kill")
	if body is Player:
		print("player!")
		emit_signal("playerDies")
