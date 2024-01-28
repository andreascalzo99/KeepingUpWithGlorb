extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.colore_uovo == "R":
		
		$Rosso.visible = true
		
	if Global.colore_uovo == "B":
		
		$Blu.visible = true

	if Global.colore_uovo == "G":
		
		$Verde.visible = true
		
	if Global.colore_uovo == "":
		
		$Verde.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Timer_timeout():
	SceneManager.goto_scene("res://scenes/scene2/scene2.tscn")

