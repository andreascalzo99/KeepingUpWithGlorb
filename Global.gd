extends Node

var vita = 3
var livello = 1
var colore_uovo = ""
var felicita = 0
var stelle = 1
var barzellette = ["I used to play piano by ear,", 
					"but now I use my hands and fingers.",
					"Why did the scarecrow win an award?",
					"Because he was outstanding in his field",
					"How do you organize a space party?",
					"You planet!"]
					
var index_barzellette = 0

var ho_fame = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

#func _process(delta):
#    pass

func save():
	# Per salvare i dati
	var file = File.new()
	file.open("user://savegame.json", File.WRITE)
	file.store_line(to_json({"stelle": stelle, "felicita": felicita, "livello": livello, "colore_uovo": colore_uovo, "vita": vita, "barzellette": barzellette}))
	file.close()

func load_save():
	# Per caricare i dati
	var file = File.new()
	if file.file_exists("user://savegame.json"):
		file.open("user://savegame.json", File.READ)
		
		var data_text = file.get_as_text()
		file.close()

		var data = parse_json(data_text)
		
		if data != null:
			if data.has("stelle"):
				stelle = data["stelle"]
			if data.has("felicita"):
				felicita = data["felicita"]
			if data.has("livello"):
				livello = data["livello"]
			if data.has("colore_uovo"):
				colore_uovo = data["colore_uovo"]
			if data.has("vita"):
				vita = data["vita"]
			if data.has("barzellette"):
				vita = data["barzellette"]
			SceneManager.goto_scene("res://scenes/scene2/scene2.tscn")
		else:
			print("Errore nel parsing del file JSON:", data_text)
		
