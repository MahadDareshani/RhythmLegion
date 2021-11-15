tool
extends ColorRect

export(float) var intensity = 0.4
export(float, 0, 1) var opacity = 0.5

const shader = preload("res://addons/shapes/Vignette.shader")

func _enter_tree():
	self.material = ShaderMaterial.new()
	self.material.set_shader(shader)

func _process(delta):
	self.material.set_shader_param("vignette_intensity", intensity)
	self.material.set_shader_param("vignette_opacity", opacity)
