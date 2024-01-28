extends Node2D

var frasi = ["","Ladies and gentlemen", "you will meet an incredibly sad alien", "from the incredibly sad planet Glirb.",
			"One day, Glerb, a friend of Glorb,", "told him that in the universe", "there's a highly amusing planet: Earth.",
			"And indeed, he's landed in Italy!", "Can you help Glorb feel better?", "Spoiler alert: he has an excellent sense of humor!",
			"*If you treat Glorb well, you will get a star.*", "consuming a star, you can use the 'LOL' button", "that allows you to tell a joke to Glorb",
			""]
var current_index = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.load_save()
	$TextBox.add_text("!!!!!!!!!!!!!!!!!!!!!!!!!!")



func _on_TouchScreenButton_pressed():
	current_index += 1
	if current_index == 13:
		SceneManager.goto_scene("res://scenes/scene0/initial_cinematic.tscn")
	$TextBox.add_text(frasi[current_index])

