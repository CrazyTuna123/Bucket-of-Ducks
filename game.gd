extends Node2D

var score: int = 0
var time_left: float = 60
var timer_warning_played: bool = false


func _ready():
	# Make sure UI always shows even when paused
	$ScoreLabel.process_mode = Node.PROCESS_MODE_ALWAYS
	$TimeLabel.process_mode = Node.PROCESS_MODE_ALWAYS

func _process(delta):
	time_left -= delta

	# Update UI
	$TimeLabel.text = "Time: " + str(ceil(time_left))
	$ScoreLabel.text = "Score: " + str(score)
	
	# Play warning once
	if time_left <= 10 and not timer_warning_played:
		timer_warning_played = true
		$TimerSound.play()

	# Game over
	if time_left <= 0:
		$EndSound.play()
		game_over()

func caught_duck():
	score += 1
	time_left += 2
	$CatchSound.play()

func missed_duck():
	time_left -= 10

	if has_node("MissSound"):
		$MissSound.play()
	else:
		print("MissSound node not found!")

func game_over():
	get_tree().paused = true
	print("Game Over!")
		
