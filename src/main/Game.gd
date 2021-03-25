extends Node2D
signal gameOver
signal gameWin

const LIMIT_LEFT = -315
const LIMIT_TOP = -250
const LIMIT_RIGHT = 955
const LIMIT_BOTTOM = 690
var enemies_count = 5

onready var map = $TileMap

func _ready():
	add_tiles()
	add_enemies()
	pass

func game_over():
	print("game gameover")
	$Player.all_enemies_count = enemies_count
	$Player.state = $Player.LifeState.DEAD
	emit_signal("gameOver")

func start():
	$Player.enemy_died_count = 0
	clear_map()
	generate_map()
	print("Game started!")
	$Player.state = $Player.LifeState.ALIVE

func _on_Enemy_playerDies():
	print("Player Died!")
	game_over() 

func clear_map():
	var children = get_children()
	for child in children:
		if child is Enemy or child is Bullet:
			child.queue_free()
	print("map cleared")

func add_enemies():
	for i in range(enemies_count):
		var MonsterEnemy = preload("res://src/GameLayer/Actors/EnemyRigidBody.tscn")
		var enemy = MonsterEnemy.instance()
		var script = preload("res://src/GameLayer/Actors/EnemyRigidBody.gd")
		enemy.set_script(script)
		enemy.gravity_scale = 0
		enemy.position.x = 50 + i + randi() % 100
		enemy.position.y = 50 - i + randi() % 100
		enemy.contact_monitor = true
		enemy.contacts_reported = 10
		enemy.connect("body_entered", enemy, "_on_RigidBody2D2_body_entered")
		enemy.connect("playerDies", self, "_on_Enemy_playerDies")
		add_child(enemy)
	print("enemies added")

func generate_map():
	print("start generate map")
	add_enemies()
	add_tiles()
	
func add_tiles():
	var sand_id = map.tile_set.find_tile_by_name("sand")
	var rock_id = map.tile_set.find_tile_by_name("rock_wall")
	var grass_id = map.tile_set.find_tile_by_name("grass")
	var grass_sand_id = map.tile_set.find_tile_by_name("sand_grass")
	for j in range(-10,10,1):
		for i in range(-10,10,1):
			if j > -5 and j < 5:
				map.set_cell(j, i, grass_id)
			elif j == -5:
				map.set_cell(j, i, grass_sand_id)
			elif j == -10 or j == 9:
				map.set_cell(j, i, rock_id)
			elif j > -7 or j < 7:
				map.set_cell(j, i, sand_id)
			if i == -10 or i == 9:
				map.set_cell(j, i, rock_id)
	print("tiles added")

func hit():
	print("HIT")

func _on_Player_playerDead():
	print("player dead!")
	game_over()


func _on_Player_playerWins():
	print("player Wins!")
	clear_map()
	emit_signal("gameWin")
