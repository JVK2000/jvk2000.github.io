extends TextEdit


func show_virtual_keyboard():
	# Define the existing text to display in the keyboard input
	var existing_text = "Enter text here"

	# Define the position and size of the input area in screen coordinates
	var rect_position = Rect2(Vector2(800, 800), Vector2(500, 500))  # x=100, y=200, width=300, height=50

	# Specify the type of virtual keyboard to display
	var type = 0
	#var type = DisplayServer.VIRTUAL_KEYBOARD_TYPE_DEFAULT

	# Set the maximum length of input (-1 for no limit)
	var max_length = -1

	# Define the cursor start and end positions (-1 for default behavior)
	var cursor_start = -1
	var cursor_end = -1

	# Show the virtual keyboard with the specified parameters
	DisplayServer.virtual_keyboard_show(existing_text, rect_position, type, max_length, cursor_start, cursor_end)
