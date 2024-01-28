extends Node2D

var last_event_time : int = 0
var event_interval : int = 1*1*10#8 * 60 * 60  # intervallo di otto ore in secondi
var basta = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	
	if Global.colore_uovo == "R":
		$RedMonster.visible = true
	if Global.colore_uovo == "B":
		$BlueMonster.visible = true
	if Global.colore_uovo == "G":
		$GreenMonster.visible = true
	if Global.colore_uovo == "":	
		$GreenMonster.visible = true

	$LVval.text = str(Global.livello)
	
	check_and_trigger_event()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func check_and_trigger_event():
	# Ottieni il tempo corrente in secondi dal tempo Unix
	var current_time = OS.get_unix_time()
	# Controlla se è passato abbastanza tempo dall'ultimo evento
	if current_time - last_event_time >= event_interval:
		# Esegui l'evento
		Global.ho_fame = true
		perdi_vita()
		# Aggiorna il tempo dell'ultimo evento
		last_event_time = current_time

		print("Evento scatenato!")
		print(last_event_time)
		print(current_time)

func perdi_vita():
	Global.ho_fame = true
	var hp_control = get_node("%HP")
	if hp_control.hp == 1:
		SceneManager.goto_scene("res://GO/GO.tscn")
	else:
		hp_control.set_hp(hp_control.hp -1)
		Global.vita = hp_control.hp
	

func _on_CleanButton_pressed():
	if $Poop.visible == true:
		$Poop.visible = false


func _on_EatButton_pressed():
	if $FoodMenu.visible == false:
		$FoodMenu.visible = true



func _on_Saver_timeout():
	Global.save()
	pass


func guarisci():
	var hp_control = get_node("%HP")
	hp_control.set_hp(hp_control.MAX_HP)
	Global.vita = hp_control.MAX_HP


func _on_Close_pressed():
	if $FoodMenu.visible == true:
		$FoodMenu.visible = false


func _on_FoodCake_pressed():
	if Global.ho_fame == true:
		Global.ho_fame = false
		
		guarisci()

		if Global.colore_uovo == "G":
			Global.livello += 2
			$LVval.text = str(Global.livello)
#			Global.stelle += 1
			$Stars/Nstars.text = str(Global.stelle)
		else:
			Global.livello += 1
			$LVval.text = str(Global.livello)
	if $FoodMenu.visible == true:
		$FoodMenu.visible = false
	

	print(Global.felicita)
		



func _on_FoodEgg_pressed():
	if Global.ho_fame == true:
		Global.ho_fame = false
		
		guarisci()
		
		if Global.colore_uovo == "R":
			Global.livello += 2
			$LVval.text = str(Global.livello)
#			Global.stelle += 1
			$Stars/Nstars.text = str(Global.stelle)
		else:
			Global.livello += 1
			$LVval.text = str(Global.livello)
	if $FoodMenu.visible == true:
		$FoodMenu.visible = false
	print(Global.felicita)


func _on_FoodBegel_pressed():
	if Global.ho_fame == true:
		Global.ho_fame = false
		
		guarisci()
		
		
		if Global.colore_uovo == "B":
			Global.livello += 2
			$LVval.text = str(Global.livello)
#			Global.stelle += 1
			$Stars/Nstars.text = str(Global.stelle)
		else:
			Global.livello += 1
			$LVval.text = str(Global.livello)
	if $FoodMenu.visible == true:
		$FoodMenu.visible = false
	print(Global.felicita)


func _on_MemeButton_pressed():
	if Global.stelle > 0:

		Global.stelle -= 1
		$Stars/Nstars.text=str(Global.stelle)
#		$TextBox.text_queue.append(Global.barzellette[Global.index_barzellette])
#		$TextBox.display_text()
		
		$TextBox.add_text(Global.barzellette[Global.index_barzellette])
		
		
		$GoOn.visible = true



func _on_GoOn_pressed():
	Global.index_barzellette +=1
	if Global.index_barzellette == 2:
		$TextBox.hide()
		$GoOn.visible = false
	$TextBox.add_text(Global.barzellette[Global.index_barzellette])
#	$TextBox.hide_textbox()
#	if basta == 1:
#		$TextBox.hide_textbox()
#		basta = 0
#	print(basta)
#	basta = 1
#
#	Global.index_barzellette += 1
#
#	$TextBox.text_queue.append(Global.barzellette[Global.index_barzellette])
#	$TextBox.display_text()

