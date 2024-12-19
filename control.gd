extends PanelContainer


var power: int = 2:
	set(val):
		power = clampi(val, 2, 100)
		RenderingServer.global_shader_parameter_set("power", power)

var itterations: int = 50:
	set(val):
		itterations = clampi(val, 0, 10000)
		RenderingServer.global_shader_parameter_set("maxItter", itterations)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("HBoxContainer/power edit").text = str(2)
	get_node("HBoxContainer/LineEdit").text = str(50)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_power_edit_text_changed(new_text: String) -> void:
	if new_text.is_valid_int():
		power = new_text.to_int()


func _on_add_1_pressed() -> void:
	power += 1
	get_node("HBoxContainer/power edit").text = str(power)


func _on_minus_2_pressed() -> void:
	power -= 1
	get_node("HBoxContainer/power edit").text = str(power)


func _on_line_edit_text_changed(new_text: String) -> void:
	if new_text.is_valid_int():
		itterations = new_text.to_int()


func _on_add_50_pressed() -> void:
	itterations += 50
	get_node("HBoxContainer/LineEdit").text = str(itterations)


func _on_minus_50_pressed() -> void:
	itterations -= 50
	get_node("HBoxContainer/LineEdit").text = str(itterations)
