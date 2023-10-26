extends Node2D

# Variáveis para rastrear a saúde dos jogadores

var player1Hp = 10
var player2Hp = 10

#Variaveis para animação do player
@onready var startButton = $StartButton
@onready var turnLabel = $TurnLabel
@onready var panel = $Panel  

@onready var true_button = $BotaoTrue
@onready var false_button = $BotaoFalse

@onready var AnimatedSpriteP1 = $Javanguarda #Cria o Animated Sprite do personagem Javanguarda
@onready var AnimationPlayerP1 = $"Javanguarda/Animation Javanguard" #Usada para chamar as animações do personagem Javanguarda
@onready var AnimatedSpriteP2 = $MestredasTags #Cria o Animated Sprite do personagem Javanguarda
@onready var AnimationPlayerP2 = $"MestredasTags/Animation php" #Usada para chamar as animações do personagem Javanguarda
var attackAnimationsJAVA = ["walk", "shield"]
var attackAnimationsPHP = ["walk", "dagger"]

# Barra de progresso da saúde dos jogadores
@onready var player1_hp_bar = $Inforboxplayer1/Player1HPBar #Atualiza as informações de vida do jogador1
@onready var player2_hp_bar = $Inforboxplayer2/Player2HPBar #Atualiza as informações de vida do jogador2

# Variável para rastrear de quem é o turno atual
var currentTurn = Players.player2

# Variáveis para controle da animação de ataque e bloqueio de respostas
var isAttacking = false  
var responseLocked = false 

# Variável para rastrear a pergunta atual
var currentQuestion = ""
var usedQuestions = [] 

var buttons = []
var current_button_index = 0
#Inicia o que é necessário para a execução do jogo
func _ready():
	
	buttons = [true_button, false_button]
	buttons[current_button_index].grab_focus()
	
	$StartButton.pressed.connect(self._start_game) # Conecta o botão "Start" à função que inicia o jogo
	
	#Esconde os botões "Verdadeiro" e "Falso" e outros elementos iniciais
	$BotaoTrue.hide() 
	$BotaoFalse.hide() 
	$Panel.hide()
	$TurnLabel.hide()
	
	# Conecta os botões "Verdadeiro" e "Falso" às funções correspondentes
	$BotaoTrue.pressed.connect( self._respond_True)
	$BotaoFalse.pressed.connect(self._respond_False)
	
	# Inicia o jogo exibindo a primeira pergunta
	intro_Question()

func _respond_True():
	# Quando o jogador escolhe "Verdadeiro," chama a função para verificar a resposta
	verify_Response("verdadeira")

func _respond_False():
	# Quando o jogador escolhe "Falso," chama a função para verificar a resposta
	verify_Response("falsa")

func performSimpleAttack(currentTurn):
	# Escolha aleatoriamente uma animação de ataque
	if currentTurn == Players.player1:
		var randomAttackIndex = randi() % attackAnimationsJAVA.size()
		var randomAttackAnimation = attackAnimationsJAVA[randomAttackIndex]
		return randomAttackAnimation
		
	else:
		
		var randomAttackIndex = randi() % attackAnimationsPHP.size()
		var randomAttackAnimation = attackAnimationsPHP[randomAttackIndex]
		return randomAttackAnimation
# Verificação da resposta do jogador
func verify_Response(playerResponse):
	

	if isAttacking or responseLocked:  # Se o personagem estiver atacando ou as respostas estiverem bloqueadas, sai da função
		return
		
	responseLocked = true # Bloqueia as respostas
	
#VERIFICA SE A RESPOSTA DO JOGADOR FOI CORRETA
	if playerResponse == Qna.questions_and_answers[currentQuestion]["resposta_correta"]:
		print("Resposta correta!")
		# Atualiza a pontuação dos jogadores com base na resposta
		
		if playerResponse == "verdadeira":
			$BotaoTrue.modulate = Color(0, 1, 0)
		else:
			$BotaoFalse.modulate = Color(0, 1, 0)


		if currentTurn == Players.player1:

			isAttacking = true 
			
			if player2Hp == 1: #Verificando se é possível finalizar o oponente
				
				AnimationPlayerP1.play("ultimate")
				await get_tree().create_timer(0.7).timeout
				AnimationPlayerP2.play("take damage")
				player2Hp -= 1
				player2_hp_bar.value = player2Hp
				await AnimationPlayerP1.animation_finished
				AnimatedSpriteP1.play("Javaguarda")
				Players.player1.point += 1
				$BotaoFalse.hide()
				AnimationPlayerP2.play("delete")
				await AnimationPlayerP2.animation_finished
				print("Player 2 perdeu!")
				
				get_tree().change_scene_to_file("res://Win Screen.tscn")
				
			else:
				
				var randomAnimation = performSimpleAttack(currentTurn)
				AnimationPlayerP1.play(randomAnimation)
				await AnimationPlayerP1.animation_finished
				
				
				isAttacking = false
				
				AnimationPlayerP2.play("take damage")
				player2Hp -= 1
				player2_hp_bar.value = player2Hp

				Players.player1.point += 1
				
				if randomAnimation == "walk":
					AnimationPlayerP1.play("moonwalk")
					await AnimationPlayerP1.animation_finished
				
				AnimatedSpriteP1.play("Javaguarda")
				alternate_Turn()
			

			
		else: #Vez do jogador 2
			
			if player1Hp == 1: #Verificando se é possível finalizar o oponente
				
				AnimationPlayerP2.play("ultimate")
				await get_tree().create_timer(0.2).timeout
				AnimationPlayerP1.play("take damage")
				await get_tree().create_timer(0.9).timeout
				AnimationPlayerP1.play("take damage")
				player1Hp -= 1
				player1_hp_bar.value = player1Hp
				await AnimationPlayerP2.animation_finished
				AnimatedSpriteP2.play("Php")
				AnimationPlayerP1.play("delete")
				await AnimationPlayerP1.animation_finished
				
				Players.player2.point += 1
				print("Player 1 perdeu!")
				get_tree().change_scene_to_file("res://Win Screen2 .tscn")
				
			else:
				
				var randomAnimation = performSimpleAttack(currentTurn)
				AnimationPlayerP2.play(randomAnimation)
				await AnimationPlayerP2.animation_finished
				
				if randomAnimation == "walk":
					AnimationPlayerP2.play("moonwalk")
					await AnimationPlayerP2.animation_finished
				
				isAttacking = false
				
				AnimationPlayerP1.play("take damage")
				player1Hp -= 1
				player1_hp_bar.value = player1Hp

				Players.player2.point += 1
							
				AnimatedSpriteP2.play("Php")
				alternate_Turn()
			

#VERIFICA SE A RESPOSTA DO JOGADOR FOI INCORRETA
	else:
		
		if playerResponse == "verdadeira":
			$BotaoTrue.modulate = Color(1, 0, 0)
		else:
			$BotaoFalse.modulate = Color(1, 0, 0)
			
		if currentTurn == Players.player1: #Se o turno for do jogador 1
			
			if player1Hp > 1:
				AnimationPlayerP1.play("walk") # *José* O Jogador que errou vai tentar atacar
				await get_tree().create_timer(1.2).timeout
				AnimationPlayerP2.play("defense") # *José* O outro jogador defende/esquiva
				await AnimationPlayerP2.animation_finished
				AnimationPlayerP2.play("counter") # *José* O outro jogador da um parry
				await get_tree().create_timer(0.2).timeout
				AnimationPlayerP1.play("take damage") # *José* O jogador que errou sofre dano
				player1Hp -= 1
				player1_hp_bar.value = player1Hp
				await get_tree().create_timer(0.3).timeout
				AnimatedSpriteP2.play("Php") # *José* Reseta a animação do jogador que deu parry
				await AnimationPlayerP2.animation_finished
				AnimationPlayerP1.play("moonwalk") # *José* O jogador que tentou atacar volta para a po
				await AnimationPlayerP1.animation_finished
				AnimatedSpriteP1.play("Javaguarda") # *José* Reseta a animação do jogador que tentou atacar
				alternate_Turn()
			else:
				alternate_Turn()
					
		#Mesma lógica do caso acima
		else: #Se o turno não for do jogador 1	
			
			if player2Hp > 1:	
				AnimationPlayerP2.play("walk")
				await get_tree().create_timer(1).timeout
				AnimationPlayerP1.play("defense")
				await AnimationPlayerP1.animation_finished
				AnimationPlayerP1.play("counter")
				AnimationPlayerP2.play("take damage")
				player2Hp -= 1
				player2_hp_bar.value = player2Hp
				await get_tree().create_timer(0.5).timeout
				AnimatedSpriteP1.play("Javaguarda")
				await AnimationPlayerP1.animation_finished
				AnimationPlayerP2.play("moonwalk")
				await AnimationPlayerP2.animation_finished
				AnimatedSpriteP2.play("Php")
				alternate_Turn()
			else:
				alternate_Turn()
						
	$BotaoTrue.set_disabled(true)
	$BotaoFalse.set_disabled(true)
	
	# Exibe a pontuação dos jogadores
	print(Players.player1.name, " Pontuação: ", Players.player1.point)
	print(Players.player2.name, " Pontuação: ", Players.player2.point)

# Alterna para o próximo jogador

	await get_tree().create_timer(2).timeout

	# Exibe a próxima pergunta
	intro_Question()

#Configuração de novas perguntas
func intro_Question():

	responseLocked = false #Desbloquear respostas
	$BotaoTrue.set_disabled(false)
	$BotaoFalse.set_disabled(false)
	
	var available_questions = []
	
	for pergunta in Qna.questions_and_answers.keys():
		if pergunta not in usedQuestions:
			available_questions.append(pergunta)
		
	if available_questions.size() == 0:
		usedQuestions = []
		available_questions = Qna.questions_and_answers.keys()
	
	currentQuestion = available_questions[randi() % available_questions.size()]
	usedQuestions.append(currentQuestion)
	
	# Exibe a pergunta no RichTextLabel
	var question = Qna.questions_and_answers[currentQuestion]["pergunta"]


	$Panel/RichTextLabel.bbcode_text = question
	$BotaoTrue.modulate = Color(1, 1, 1)
	$BotaoFalse.modulate = Color(1, 1, 1)

#Inicia o jogo e controla o turno
func _start_game():

	currentTurn = Players.player1
	turnLabel.text = "Jogador 1"
	$TurnLabel.add_theme_color_override("font_color", Color("Purple"))

	intro_Question()
	
	startButton.hide()
	
	$BotaoTrue.show()
	$BotaoFalse.show()
	$Panel.show()
	$TurnLabel.show()
		

		
func alternate_Turn():
	
	if currentTurn == Players.player1:
		
		currentTurn = Players.player2 
		$TurnLabel.text = "Jogador 2"
		$TurnLabel.add_theme_color_override("font_color", Color("Blue"))
		print("Jogador 2")
		
	else:
		
		currentTurn = Players.player1
		turnLabel.text = "Jogador 1"
		$TurnLabel.add_theme_color_override("font_color", Color("Purple"))
		print("Jogador 1")

#############################################################################
func _process(delta):
	if Input.is_action_just_pressed("ui_right"):
		if current_button_index < buttons.size() - 1:
			current_button_index += 1
			buttons[current_button_index].grab_focus()
	if Input.is_action_just_pressed("ui_left"):
		if current_button_index > 0:
			current_button_index -= 1
			buttons[current_button_index].grab_focus()
	if Input.is_action_just_pressed("ui_accept"):
		buttons[current_button_index].emit_signal("pressed")
