
extends AnimatedSprite

# Proprietà per la velocità del movimento verso il basso
var speed = 140 
var uovo = RandomNumberGenerator.new()

# Chiamato all'avvio del gioco
func _ready():
	uovo.randomize()
	var uovo1 = uovo.randi_range(1, 3)

	if uovo1 == 1:
		Global.colore_uovo = "R"


	if uovo1 == 2:
		Global.colore_uovo = "B"


	if uovo1 == 3:
		Global.colore_uovo = "G"



# Chiamato ad ogni frame
func _process(delta):
	# Muovi il nodo verso il basso
	position.y += speed * delta


func _on_Timer_timeout():
	
	SceneManager.goto_scene("res://scenes/scene1/scene1.tscn")
