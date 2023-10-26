extends Control

# Lista dos botões em ordem para a navegação por teclado
var buttons = []
var current_button_index = 0

# Variáveis para os menus e sons
@onready var main_menu = $"Main menu"
@onready var controls_menu = $"Controls Menu"
@onready var credits_menu = $"Credits Menu"
@onready var button_sounds = $"Button Sounds"
@onready var select_sound = $SelectSound

func _ready():
	# Define os botões
	buttons = [$"Main menu/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/start game", 
	$"Main menu/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/controls button",
	$"Main menu/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/credits button", 
	$"Main menu/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/exit button",
	$"Controls Menu/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/back button controls",
	$"Credits Menu/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/back button credits"
	]
	# Define o foco inicial no primeiro botão
	buttons[current_button_index].grab_focus()
func _process(delta):
	if Input.is_action_just_pressed("ui_down"):
		if controls_menu.visible or credits_menu.visible:
			# Se estiver nos menus de controles ou créditos, não permita que o índice mude
			pass
		elif current_button_index < buttons.size() - 1:
			current_button_index += 1
			buttons[current_button_index].grab_focus()
			select_sound.play()
	if Input.is_action_just_pressed("ui_up"):
		if controls_menu.visible or credits_menu.visible:
			# Se estiver nos menus de controles ou créditos, não permita que o índice mude
			pass
		elif current_button_index > 0:
			current_button_index -= 1
			buttons[current_button_index].grab_focus()
			select_sound.play()
	if Input.is_action_just_pressed("ui_accept"):
		buttons[current_button_index].emit_signal("pressed")


func _on_start_game_pressed():
	button_sounds.play()
	get_tree().change_scene_to_file("res://history_Screen.tscn")
	main_menu.visible = false
	controls_menu.visible = false
	credits_menu.visible = false

func _on_controls_button_pressed():
	button_sounds.play()
	main_menu.visible = false
	controls_menu.visible = true
	credits_menu.visible = false
	current_button_index = buttons.find($"Controls Menu/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/back button controls")
	buttons[current_button_index].grab_focus()

func _on_credits_button_pressed():
	button_sounds.play()
	main_menu.visible = false
	controls_menu.visible = false
	credits_menu.visible = true
	current_button_index = buttons.find($"Credits Menu/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/back button credits")
	buttons[current_button_index].grab_focus()

func _on_exit_button_pressed():
	button_sounds.play()
	get_tree().quit()

func _on_back_button_credits_pressed():
	button_sounds.play()
	main_menu.visible = true
	controls_menu.visible = false
	credits_menu.visible = false
	current_button_index = buttons.find($"Main menu/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/start game")
	buttons[current_button_index].grab_focus()

func _on_back_button_controls_pressed():
	button_sounds.play()
	main_menu.visible = true
	controls_menu.visible = false
	credits_menu.visible = false
	current_button_index = buttons.find($"Main menu/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/start game")
	buttons[current_button_index].grab_focus()
