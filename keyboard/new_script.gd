extends ScrollContainer

# Parameters for inertia
var scrolling_velocity: Vector2 = Vector2.ZERO
var friction: float = 0.97  # Lower = quicker slowdown
var is_dragging: bool = false

@onready var h_scroll = get_h_scroll_bar()
@onready var v_scroll = get_v_scroll_bar()

func _gui_input(event: InputEvent) -> void:
	# Handle touch press/release
	if event is InputEventScreenTouch:
		is_dragging = true if event.pressed else false

	# Handle drag movement
	elif event is InputEventScreenDrag:
		# On drag, update scroll offset directly and capture velocity
		is_dragging = true
		scrolling_velocity = event.velocity

		# Subtract relative to scroll in natural direction
		scroll_horizontal = clamp(scroll_horizontal - event.relative.x, 0, h_scroll.max_value)
		scroll_vertical = clamp(scroll_vertical - event.relative.y, 0, v_scroll.max_value)


func _process(delta: float) -> void:
	# Apply inertia when touch released
	if not is_dragging:

		print("scrolling_velocity: ", scrolling_velocity)
		
		# Move by current velocity scaled by delta
		scroll_horizontal = clamp(scroll_horizontal - scrolling_velocity.x * delta, 0, h_scroll.max_value)
		scroll_vertical = clamp(scroll_vertical - scrolling_velocity.y * delta, 0, v_scroll.max_value)
		
		# Apply friction to velocity
		scrolling_velocity *= friction
