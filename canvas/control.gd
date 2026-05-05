extends Control
@onready var color_rect: ColorRect = $Control/ColorRect
func _process(delta: float) -> void:
	color_rect.rotation_degrees += delta*20
