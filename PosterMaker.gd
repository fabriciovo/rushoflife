extends Control

var selected_Letters = []
var words_Found = []
var start_Timer_CountDown = 3
var dificulty = 5
var words_Left
var first_Word = true
var game_CountDown


func _ready():
	randomize()
	var letters_Data_Bank = Get_From_Json("Dicionario.json");
	selected_Letters = letters_Data_Bank[randi() % letters_Data_Bank.size()]
	selected_Letters.Letters.shuffle()
	words_Left = dificulty
	$Prompt_Screen/Prompt.text = "Ache " + str(dificulty) + " palavras"
#	SETANDO O TEMPO QUE O JGADOR TEM PARA ACHAR AS PALAVRAS, PODE SER MUDADO TROCANDO O TEMPO NA CENA
	game_CountDown = int($Game_Container/HBoxContainer2/Game_Countdown.text)


#	TIRANDO O PROMPT INICIAL E O TIMER DA TELA
func Start_Game():
	$Prompt_Screen.queue_free()
	$Game_Container.show()
	$Game_Container/HBoxContainer/LineEdit.grab_focus()
	$Game_Container/GameTimer.start()
#	MOSTRANDO AS LETRAS SELECIONADAS AO PLAYER
	$Game_Container/Selected_Letters.text = ""
	for i in selected_Letters.Letters:
		$Game_Container/Selected_Letters.text = $Game_Container/Selected_Letters.text + i + " "


#	RECEBENDO O INPUT DO PLAYER AO APERTAR O BOTAO
func _on_TextureButton_pressed():
	_on_LineEdit_text_entered($Game_Container/HBoxContainer/LineEdit.text)


#	RECEBENDO O INPUT DO PLAYER AO APERTAR ENTER
func _on_LineEdit_text_entered(new_text):
	$Game_Container/HBoxContainer/LineEdit.clear()
	Check_Player_Input(new_text)


func Check_Player_Input(player_Input):
#	VERIFICANDO SE A PALAVRA JA FOI ENCONTRADA
	for word in words_Found:
		if player_Input.to_lower() == word:
			return
#	VERIFICANDO SE A PALAVRA EXISTE
	for word in selected_Letters.Possible_Words:
		if player_Input.to_lower() == word:
			Update_Score(player_Input)
			words_Found.append(player_Input.to_lower())
			break


#	ATUALIZANDO AS PALAVRAS ENCONTRADAS
func Update_Score(text_update):
#	SE FOR A PRIMEIRA PALAVRA, LIMPA O TEXTO PLACEHOLDER
	if first_Word:
		$Game_Container/HBoxContainer2/Words_Created.text = text_update
		first_Word = false
#	CASO CONTRARIO, SOMA AS PALAVRAS COM UM ESPACO ENTRE ELAS
	else:
		$Game_Container/HBoxContainer2/Words_Created.text = $Game_Container/HBoxContainer2/Words_Created.text + " / " + text_update
	words_Left -= 1
	if words_Left <= 0:
		Success_Screen()


func Success_Screen():
	$Game_Container.queue_free()
	$End_Screnn_Container.show()
	$End_Screnn_Container/End_Message.text = "Voce conseguiu! Parabens!!!"
	$End_Screnn_Container/Final_Score.text = str(dificulty - words_Left) + " palavras de: " + str(dificulty)
	pass


func Fail_Screen():
	$Game_Container.queue_free()
	$End_Screnn_Container.show()
	$End_Screnn_Container/End_Message.text = "Voce falhou!!!"
	$End_Screnn_Container/Final_Score.text = str(dificulty - words_Left) + " palavras de: " + str(dificulty)
	pass


func _on_GameTimer_timeout():
	game_CountDown -= 1
	$Game_Container/HBoxContainer2/Game_Countdown.text = str(game_CountDown)
	if game_CountDown <= 0:
		Fail_Screen()


#	ATUALIZANDO O TIMER INICIAL
func _on_Start_Timer_timeout():
	start_Timer_CountDown -= 1
	$Prompt_Screen/Start_Count_Down.text = str(start_Timer_CountDown)
	
	if start_Timer_CountDown <= 0:
		Start_Game()


#	ABRINDO O ARQUIVO JSON E PEGANDO OS DADOS
func Get_From_Json(fileName):
	var file = File.new();
	file.open(fileName, File.READ)
	var text = file.get_as_text()
	var data = parse_json(text)
	file.close()
	return data


func _on_Try_Again_BTN_pressed():
	get_tree().reload_current_scene()