extends Node2D

@export var mob_scene: PackedScene

var screen_size : Vector2i
var PlayerInitialPosition

func _ready():
	screen_size = get_window().size
	PlayerInitialPosition = $Insaneplayer.position
	GHUD.start_game_btn.connect(new_game)

func new_game():
	$Insaneplayer.position = PlayerInitialPosition
	$Floor.position.x = 0
	$MOBTimer.start()

func game_over():
	GHUD.update_highscore_label()

func _process(delta):
	$Floor.position.x = $Insaneplayer.position.x - 150
		
	
func _on_mob_timer_timeout():
	var mob = mob_scene.instantiate()
	mob.position.x = $Insaneplayer.position.x + 1500
	mob.position.y = 602
	add_child(mob)
	mob.hit.connect(game_over)
	$MOBTimer.wait_time = 1
