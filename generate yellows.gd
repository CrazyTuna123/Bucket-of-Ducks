extends Node2D

const YELLOW = preload("res://yellow.tscn")

var difficulty_speed: float = 0.0

func _ready():
	$Timer.wait_time = 1
	$Timer.timeout.connect(on_timeout)
	$Timer.start()

func on_timeout():
	var yellow = YELLOW.instantiate()

	# Increase difficulty
	difficulty_speed += 1.05
	yellow.fall_speed += difficulty_speed

	# Faster spawn rate
	$Timer.wait_time = max(0.1, $Timer.wait_time - 0.005)

	# Random spawn position
	yellow.position = Vector2(
		randf_range(-200, 350),
		-200
	)

	add_child(yellow)
