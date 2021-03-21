extends CanvasLayer
class_name GameOver
signal showMenu

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func hide():
	$Label.hide()
	$AnimatedSprite.hide()
	$TouchScreenButton.hide()

func show():
	$Label.show()
	$AnimatedSprite.hide()
	$TouchScreenButton.show()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func show_blood_wall():
	$AnimatedSprite.show()
	$AnimatedSprite.animation = "blood_wall"
	$AnimatedSprite.play()


func _on_AnimatedSprite_animation_finished():
	$TouchScreenButton.show()


func _on_TouchScreenButton_pressed():
	emit_signal("showMenu")
	$AnimatedSprite.hide()
