extends KinematicBody2D

const WALK_SPEED = 200

var velocity = Vector2()

func _physics_process(_delta):
	if Input.is_action_pressed("ui_down"):
		velocity.y = WALK_SPEED
	elif Input.is_action_pressed("ui_up"):
		velocity.y = -WALK_SPEED
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  WALK_SPEED
	else:
		$AnimatedSprite.animation = "stand"
		$AnimatedSprite.play()
		velocity.x = 0
		velocity.y = 0
	move_and_slide(velocity, Vector2(0, -1))
