class_name Bullet
extends RigidBody2D
signal enemyDies

onready var animation_player = $AnimationPlayer

func _ready():
	pass
	#connect("body_entered", self, "_on_Bullet_body_entered")

func _on_Bullet_body_entered(body):
	print("entered!")
	print(body)
	if body is Enemy:
		body.queue_free()
		print("enemy destroyed!")
		emit_signal("enemyDies")
	queue_free()


func _on_Bullet_body_shape_entered(body_id, body, body_shape, local_shape):
	print("entered shape!")
	print(body)
