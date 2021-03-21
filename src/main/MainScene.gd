extends Node

const LIMIT_LEFT = -315
const LIMIT_TOP = -250
const LIMIT_RIGHT = 955
const LIMIT_BOTTOM = 690

func _ready():
	$HUD.show_menu()
	pass


	# Static types are necessary here to avoid warnings.
			#camera.limit_left = LIMIT_LEFT
			#camera.limit_top = LIMIT_TOP
			#camera.limit_right = LIMIT_RIGHT
			#camera.limit_bottom = LIMIT_BOTTOM
	#elif action_suffix == "_p2":
	#var viewport: Viewport = $"../../../../ViewportContainer2/Viewport"
	#viewport.world_2d = ($"../.." as Viewport).world_2d
	#camera.custom_viewport = viewport

func set_camera():
	var camera = $Game.get_node("Player").get_node("Camera2D")
	#for $Game in get_children():
	#if child is Player:
	#var camera = child.get_node("Camera")

func game_over():
	print("game_over")
	$HUD.game_over()

func _on_HUD_start():
	print("HUD_start")
	set_camera()
	$HUD.get_node("Menu").hide()
	$Game.start()


func _on_Game_gameOver():
	$Game.hide()
	$HUD.game_over()
