extends Control


func _ready() -> void:
	print("Virtual Keyboard Enabled:", DisplayServer.has_feature(DisplayServer.FEATURE_VIRTUAL_KEYBOARD))


#func _process(delta: float) -> void:
	#print("height: ", DisplayServer.virtual_keyboard_get_height())
	#print("FEATURE_VIRTUAL_KEYBOARD: ", DisplayServer.has_feature(DisplayServer.FEATURE_VIRTUAL_KEYBOARD))


func _on_text_edit_focus_entered() -> void:
	$Label.text = "focus"


func _on_text_edit_focus_exited() -> void:
	$Label.text = "blur"
