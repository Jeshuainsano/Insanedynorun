extends Area2D

signal hit

func _ready():
	GHUD.mob_counter = GHUD.mob_counter + 1
	var collisions = [
		$bluecolission,
		$Iponecolission,
		$Roca1Collision,
		$Roca2colission,
		$Roca3colission,
		$Roca4colission,
		$Roca5colission
	]
	var sprite = [
		$Bluesprite,
		$Iphonesprite,
		$Roca1sprite,
		$Roca2sprite,
		$Roca3sprite,
		$Roca4sprite,
		$Roca5sprite
	]
	var random_int = randi() % collisions.size()
	
	var selected_collision = collisions[random_int]
	var selected_sprite = sprite[random_int]
	
	selected_collision.visible = true
	selected_collision.disabled = false
	selected_sprite.visible = true


func _on_visible_on_screen_notifier_2d_screen_exited():
	if GHUD.mob_counter > 0:
		GHUD.mob_counter = GHUD.mob_counter - 1
	queue_free()


func _on_body_entered(body):
	if body.is_in_group("dinomax"):
		hit.emit()
