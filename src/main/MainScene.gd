extends Node

const LIMIT_LEFT = -315
const LIMIT_TOP = -250
const LIMIT_RIGHT = 955
const LIMIT_BOTTOM = 690

func _ready():
	$HUD.show_menu()
	$AudioStreamPlayer.play()
	pass

func set_camera():
	var camera = $Game.get_node("Player").get_node("Camera2D")

func game_over():
	print("game_over")
	$HUD.game_over()

func _on_HUD_start():
	print("HUD_start")
	set_camera()
	$HUD.get_node("Menu").hide()
	$Game.show()
	$Game.start()
	


func _on_Game_gameOver():
	$Game.hide()
	$HUD.game_over()


func _on_Game_gameWin():
	$HUD.show_win()
	$Game.hide()
