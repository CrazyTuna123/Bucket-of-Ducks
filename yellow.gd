extends Area2D

var fall_speed: float = 300.0

func _ready():
	$QuackSound.play()

func _process(delta):
	position.y += fall_speed * delta

	# Miss detection (duck fell off screen)
	if position.y > 480:
		get_tree().current_scene.missed_duck()
		queue_free()

func _on_area_entered(area):
	if area.name == "bucketCollision":
		get_tree().current_scene.caught_duck()
		queue_free()

func _on_body_entered(body):
	if body.name == "bucket":
		get_tree().current_scene.caught_duck()
		queue_free()
