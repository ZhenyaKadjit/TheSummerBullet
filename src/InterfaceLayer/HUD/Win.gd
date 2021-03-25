extends CanvasLayer
signal win

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func show():
	$Label.show()
	$AnimatedSprite.show()
	$AnimatedSprite.play()

func hide():
	$AnimatedSprite.hide()
	$Label.hide()

func _on_AnimatedSprite_animation_finished():
	emit_signal("win")
