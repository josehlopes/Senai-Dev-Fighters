extends Control

func _ready():
	$ScoreLabel.text = str(Players.player1.point) + "-" + str(Players.player2.point)

func _on_restart_pressed():
	get_tree().change_scene_to_file("res://question_combat.tscn")


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://menu_screen.tscn")
