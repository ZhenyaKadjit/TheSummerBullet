extends CanvasLayer
class_name HUD
signal start

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _start():
	pass

func show_menu():
	$Menu.show()
	$GameOver.hide()
	$Win.hide()

func _on_Button_pressed():
	print("start?")
	emit_signal("start")

func game_over():
	$GameOver.show()
	$GameOver.show_blood_wall()

func _on_GameOver_showMenu():
	show_menu()

func _on_Win_win():
	show_menu()

func show_win():
	$Win.show()
