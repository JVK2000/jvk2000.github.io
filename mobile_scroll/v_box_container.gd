extends VBoxContainer

const OBJ = preload("res://obj.tscn")


func _ready() -> void:
	for i in 500:
		var obj = OBJ.instantiate()
		obj.find_child("Label").text = str(i)
		add_child(obj)
