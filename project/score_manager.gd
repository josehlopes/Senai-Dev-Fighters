extends Control

func _ready():
	$ScoreLabel.text = str(Players.player1.point) + "-" + str(Players.player2.point)
