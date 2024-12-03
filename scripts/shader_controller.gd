extends Control
#ignore the code just for testing

@export var shader_material: ShaderMaterial

@onready var line_color: ColorPickerButton = $MarginContainer/VBoxContainer/line_color
@onready var line_outline_color: ColorPickerButton = $MarginContainer/VBoxContainer/line_outline_color
@onready var line_thickness: HSlider = $MarginContainer/VBoxContainer/line_thickness
@onready var line_length: HSlider = $MarginContainer/VBoxContainer/line_length
@onready var line_offset: HSlider = $MarginContainer/VBoxContainer/line_offset
@onready var line_outline_thickness: HSlider = $MarginContainer/VBoxContainer/line_outline_thickness
@onready var dot_color: ColorPickerButton = $MarginContainer/VBoxContainer/dot_color
@onready var dot_outline_color: ColorPickerButton = $MarginContainer/VBoxContainer/dot_outline_color
@onready var dot_size: HSlider = $MarginContainer/VBoxContainer/dot_size
@onready var dot_outline_thickness: HSlider = $MarginContainer/VBoxContainer/dot_outline_thickness
@onready var antialiasing: HSlider = $MarginContainer/VBoxContainer/antialiasing

var default_values = {
	"line_color": Color(0, 1, 0, 0.8),
	"line_outline_color": Color(0, 0, 0),
	"line_thickness": 0.2,
	"line_length": 0.2,
	"line_offset": 0.2,
	"line_outline_thickness": 0.5,
	"dot_color": Color(0, 1, 0, 0.8),
	"dot_outline_color": Color(0, 0, 0),
	"dot_size": 0.2,
	"dot_outline_thickness": 0.5,
	"antialiasing": 1.0
}


# Called when the node enters the scene tree for the first time
func _ready():
	# Set default values for the controls
	line_color.color = default_values["line_color"]
	line_outline_color.color = default_values["line_outline_color"]
	line_thickness.value = default_values["line_thickness"]
	line_length.value = default_values["line_length"]
	line_offset.value = default_values["line_offset"]
	line_outline_thickness.value = default_values["line_outline_thickness"]
	dot_color.color = default_values["dot_color"]
	dot_outline_color.color = default_values["dot_outline_color"]
	dot_size.value = default_values["dot_size"]
	dot_outline_thickness.value = default_values["dot_outline_thickness"]
	antialiasing.value = default_values["antialiasing"]

# Reset values to default
func _on_reset_button_pressed():
	line_color.color = default_values["line_color"]
	line_outline_color.color = default_values["line_outline_color"]
	line_thickness.value = default_values["line_thickness"]
	line_length.value = default_values["line_length"]
	line_offset.value = default_values["line_offset"]
	line_outline_thickness.value = default_values["line_outline_thickness"]
	dot_color.color = default_values["dot_color"]
	dot_outline_color.color = default_values["dot_outline_color"]
	dot_size.value = default_values["dot_size"]
	dot_outline_thickness.value = default_values["dot_outline_thickness"]
	antialiasing.value = default_values["antialiasing"]
	
	shader_material.set_shader_parameter("line_color", default_values["line_color"])
	shader_material.set_shader_parameter("line_outline_color", default_values["line_outline_color"])
	shader_material.set_shader_parameter("line_thickness", default_values["line_thickness"])
	shader_material.set_shader_parameter("line_length", default_values["line_length"])
	shader_material.set_shader_parameter("line_offset", default_values["line_offset"])
	shader_material.set_shader_parameter("line_outline_thickness", default_values["line_outline_thickness"])
	shader_material.set_shader_parameter("dot_color", default_values["dot_color"])
	shader_material.set_shader_parameter("dot_outline_color", default_values["dot_outline_color"])
	shader_material.set_shader_parameter("dot_size", default_values["dot_size"])
	shader_material.set_shader_parameter("dot_outline_thickness", default_values["dot_outline_thickness"])
	shader_material.set_shader_parameter("antialiasing", default_values["antialiasing"])



func _on_line_color_color_changed(color: Color) -> void:
	shader_material.set_shader_parameter("line_color", color)

func _on_line_outline_color_color_changed(color: Color) -> void:
	shader_material.set_shader_parameter("line_outline_color", color)

func _on_line_thickness_value_changed(value: float) -> void:
	shader_material.set_shader_parameter("line_thickness", value)


func _on_line_length_value_changed(value: float) -> void:
	shader_material.set_shader_parameter("line_length", value)


func _on_line_offset_value_changed(value: float) -> void:
	shader_material.set_shader_parameter("line_offset", value)


func _on_line_outline_thickness_value_changed(value: float) -> void:
	shader_material.set_shader_parameter("line_outline_thickness", value)


func _on_dot_color_color_changed(color: Color) -> void:
	shader_material.set_shader_parameter("dot_color", color)


func _on_dot_outline_color_color_changed(color: Color) -> void:
	shader_material.set_shader_parameter("dot_outline_color", color)


func _on_dot_size_value_changed(value: float) -> void:
	shader_material.set_shader_parameter("dot_size", value)


func _on_dot_outline_thickness_value_changed(value: float) -> void:
	shader_material.set_shader_parameter("dot_outline_thickness", value)


func _on_antialiasing_value_changed(value: float) -> void:
	shader_material.set_shader_parameter("antialiasing", value)
