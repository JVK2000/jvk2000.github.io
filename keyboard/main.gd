extends Control


func _ready() -> void:
	print("Virtual Keyboard Enabled:", DisplayServer.has_feature(DisplayServer.FEATURE_VIRTUAL_KEYBOARD))
