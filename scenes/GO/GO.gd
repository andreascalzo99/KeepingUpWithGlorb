extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	delete_save()


func delete_save():
	var file_path = "user://savegame.json"
	
	if File.exists(file_path):
		var success = File.remove(file_path)
		
		if success == OK:
			print("File di salvataggio eliminato con successo.")
		else:
			print("Errore durante l'eliminazione del file di salvataggio.")
	else:
		print("Il file di salvataggio non esiste.")


func _on_Timer_timeout():
	get_tree().quit()
