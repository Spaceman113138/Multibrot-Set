extends MeshInstance2D


var xSize: Vector2 = Vector2(-2,2):
	set(val):
		xSize = val
		RenderingServer.global_shader_parameter_set("xRange", xSize)
var ySize: Vector2 = Vector2(-2,2):
	set(val):
		ySize = val
		RenderingServer.global_shader_parameter_set("yRange", ySize)

@export var scaleVal: float = 0.004:
	set(val):
		scaleVal = val
		resize()

@export var power: int = 2:
	set(val):
		power = val
		RenderingServer.global_shader_parameter_set("power", power)

@export var steps: int = 50:
	set(val):
		steps = val
		RenderingServer.global_shader_parameter_set("maxItter", steps)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_window().size_changed.connect(resize)
	resize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func resize():
	var window = get_window()
	if window != null:
		mesh.size = get_window().size
		var halfSize: Vector2 = (mesh.size/2) * scaleVal
		xSize = Vector2(-halfSize.x, halfSize.x)
		ySize = Vector2(-halfSize.y, halfSize.y)
