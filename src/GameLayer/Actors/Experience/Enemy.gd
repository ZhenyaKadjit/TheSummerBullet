extends KinematicBody2D

enum LifeState {
	WALKING,
	DEAD,
}
var state = LifeState.WALKING
var velocity = Vector2()

const WALK_SPEED = 200

func track_player():
	pass
	#var space_rid = get_world_2d().space
	#var space_state = Physics2DServer.space_get_direct_state(space_rid)
	#var result = space_state.intersect_ray(Vector2(0, 0), Vector2(50, 50))
	#if result:
		#print("Hit at point: ", result.position, result.collider)

func _physics_process(_delta):
	#track_player()
	$AnimationPlayer.play("Walk")
	move_and_slide(velocity, Vector2(0, -1))

func destroy():
	state = LifeState.DEAD
	velocity = Vector2.ZERO
	queue_free()

