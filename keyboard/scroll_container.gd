extends ScrollContainer

# Parameters for inertia
var scrolling_velocity: Vector2 = Vector2.ZERO
var friction: float = 0.97  # Per-second friction
var velocity_threshold: float = 20.0  # Pixels per second
var is_dragging: bool = false
var last_drag_time: float = 0.0
var drag_timeout: float = 0.1  # Seconds before considering drag stale

@onready var h_scroll = get_h_scroll_bar()
@onready var v_scroll = get_v_scroll_bar()

func _gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		is_dragging = event.pressed
		if not event.pressed:
			# Discard old drag velocities
			if Time.get_ticks_msec() / 1000.0 - last_drag_time > drag_timeout:
				scrolling_velocity = Vector2.ZERO

	elif event is InputEventScreenDrag:
		is_dragging = true
		last_drag_time = Time.get_ticks_msec() / 1000.0
		scrolling_velocity = event.velocity

		# Update scroll position (keep this uncommented)
		scroll_horizontal = clamp(scroll_horizontal - event.relative.x, 0, h_scroll.max_value)
		scroll_vertical = clamp(scroll_vertical - event.relative.y, 0, v_scroll.max_value)

func _process(delta: float) -> void:
	if is_dragging:
		# Natural slowdown while maintaining contact
		scrolling_velocity *= pow(0.9, delta)
	else:
		# Apply velocity with delta time
		var prev_h = scroll_horizontal
		var prev_v = scroll_vertical

		scroll_horizontal = clamp(prev_h - scrolling_velocity.x * delta, 0, h_scroll.max_value)
		scroll_vertical = clamp(prev_v - scrolling_velocity.y * delta, 0, v_scroll.max_value)
		
		# Boundary detection
		if scroll_horizontal == prev_h: scrolling_velocity.x = 0.0
		if scroll_vertical == prev_v: scrolling_velocity.y = 0.0

		# Frame-rate independent friction
		scrolling_velocity *= friction

		# Velocity threshold using squared magnitude (more efficient)
		if scrolling_velocity.length_squared() < velocity_threshold * velocity_threshold:
			scrolling_velocity = Vector2.ZERO
