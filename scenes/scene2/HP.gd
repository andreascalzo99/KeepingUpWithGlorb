extends HBoxContainer

const MAX_HP = 3
var hp = Global.vita

func _ready():
	set_hp(4)

func set_hp(new_hp):
	hp = new_hp
	for i in range(MAX_HP):
		var heart = get_node("Heart" + str(i+1))
		heart.visible = hp > i
		
func guarisci():
	hp = MAX_HP
	Global.vita = MAX_HP
