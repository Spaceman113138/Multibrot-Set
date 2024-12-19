extends Node2D

var offset: Vector2 = Vector2.ZERO:
	set(val):
		offset = val
		RenderingServer.global_shader_parameter_set("offset", offset)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if event.button_mask == 1:
			offset += Vector2(-event.velocity.x, -event.velocity.y) * get_node("set").scaleVal / 50
	elif event is InputEventMouseButton:
		if event.button_index == 4 and event.pressed:
			get_node("set").scaleVal -= get_node("set").scaleVal/10
			if get_node("set").scaleVal < 0:
				get_node("set").scaleVal = 0
		if event.button_index == 5 and event.pressed:
			get_node("set").scaleVal += get_node("set").scaleVal / 10


func _unhandled_key_input(event: InputEvent) -> void:
	if event is InputEventKey:
		var key: String = event.as_text_key_label()
		print(key)
		match key:
			"W", "Up":
				offset -= Vector2(0, 100) * get_node("set").scaleVal / 50
			"S", "Down":
				offset += Vector2(0, 100) * get_node("set").scaleVal / 50
			"A", "Left":
				offset -= Vector2(100, 0) * get_node("set").scaleVal / 50
			"D", "Right":
				offset += Vector2(100, 0) * get_node("set").scaleVal / 50
			"E":
				get_node("set").scaleVal -= get_node("set").scaleVal/10
				if get_node("set").scaleVal < 0:
					get_node("set").scaleVal = 0
			"Q":
				get_node("set").scaleVal += get_node("set").scaleVal / 10
