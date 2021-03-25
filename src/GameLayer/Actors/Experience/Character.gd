extends RigidBody2D


var velocity = Vector2()
const WALK_SPEED = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.animation = "walk"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AnimatedSprite.play()
	if Input.is_action_pressed("ui_down"):
		velocity.y = WALK_SPEED
	elif Input.is_action_pressed("ui_up"):
		velocity.y = -WALK_SPEED
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  WALK_SPEED
	else:
		velocity.x = 0
		velocity.y = 0
	velocity = velocity

func die():
	$AnimatedSprite.animation = "dead"
