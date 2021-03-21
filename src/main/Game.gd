extends Node2D
signal gameOver

const LIMIT_LEFT = -315
const LIMIT_TOP = -250
const LIMIT_RIGHT = 955
const LIMIT_BOTTOM = 690

func _ready():
	pass

	# Static types are necessary here to avoid warnings.
	#for child in get_children():
		#if child is Player:
			#var camera = child.get_node("Camera")
			#camera.limit_left = LIMIT_LEFT
			#camera.limit_top = LIMIT_TOP
			#camera.limit_right = LIMIT_RIGHT
			#camera.limit_bottom = LIMIT_BOTTOM
	#elif action_suffix == "_p2":
	#var viewport: Viewport = $"../../../../ViewportContainer2/Viewport"
	#viewport.world_2d = ($"../.." as Viewport).world_2d
	#camera.custom_viewport = viewport

func game_over():
	$Player.state = $Player.LifeState.DEAD
	emit_signal("gameOver")

func start():
	$Player.state = $Player.LifeState.ALIVE
	$Enemy.state = $Enemy.LifeState.ALIVE

func _on_Enemy_playerDies():
	print("Player Died!")
	game_over() 
