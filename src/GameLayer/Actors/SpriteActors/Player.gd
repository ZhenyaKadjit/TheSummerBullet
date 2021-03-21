extends KinematicBody2D
class_name Player

enum LifeState {
	ALIVE,
	DEAD,
}
onready var state = LifeState.ALIVE setget state_setter, state_getter

func state_setter(new_value):
	state = new_value
	match state:
		LifeState.ALIVE:
			position.x = 0
			position.y = 0
			print("player state is alive")
			$CollisionShape2D.set_deferred("enabled", true)
			show()
		LifeState.DEAD:
			print("player state is dead")
			# Must be deferred as we can't change physics properties on a physics callback.
			$CollisionShape2D.set_deferred("disabled", true)
			hide() # Player disappears after being hit.

func state_getter():
	return state

const WALK_SPEED = 200

var velocity = Vector2()

func _physics_process(_delta):
	if Input.is_action_pressed("ui_down"):
		velocity.y = WALK_SPEED
		$AnimationPlayer.play("Walk")
	elif Input.is_action_pressed("ui_up"):
		velocity.y = -WALK_SPEED
		$AnimationPlayer.play("Walk")
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
		$AnimationPlayer.play("Walk")
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  WALK_SPEED
		$AnimationPlayer.play("Walk")
	elif Input.is_action_pressed("ui_shoot"):
		var mouseVector = get_global_mouse_position()
		var playerPosition = $Camera2D.get_camera_position()
		var realMouseVector = Vector2(mouseVector.x - playerPosition.x, mouseVector.y - playerPosition.y)
		$Sprite.get_node("Gun").shoot(realMouseVector)
		if not $ShootAnimation.is_stopped():
			return
		$ShootAnimation.start()
		#$AnimationPlayer.play("Shoot")
		print("shoot")
	else:
		velocity.x = 0
		velocity.y = 0
	move_and_slide(velocity, Vector2(0, -1))

func _ready():
	# Static types are necessary here to avoid warnings.
	pass

func call_menu():
	pass
	#if $HUD.get_node("Main").start()
