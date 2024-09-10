extends ColorRect


func _ready() -> void:
	get_tree().get_root().size_changed.connect(_on_viewport_resized)
	set_crt_resolution_value()
	
	#print(DisplayServer.window_get_size())


func set_crt_resolution_value() -> void:
	var screen_size = get_viewport().size
	var new_resolution_value = Vector2(screen_size.x/3.0, screen_size.y/1.5)
	material.set_shader_parameter("resolution", new_resolution_value)
	
	#print("Updated screen size: ", screen_size)
	#print("Updated CRT resolution value: ", new_resolution_value)


func _on_viewport_resized() -> void:
	set_crt_resolution_value()
