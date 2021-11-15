extends Node2D

func _ready():
	$Sprite.frame = 8
	$Sprite/CPUParticles2D.emitting = false
	$Sprite.material.set_shader_param("size", 2)
	$Sprite.material.set_shader_param("force", 1)
