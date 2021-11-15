extends Node2D

onready var particles = preload("res://Project/Resources/VFX/HitSparkParticles.tscn")

func do_idle():
	var part_ins1 = particles.instance()
	var part_ins2 = particles.instance()
	part_ins1.emitting = true
	part_ins1.rotation_degrees = 90
	$Sprite.add_child(part_ins1)
	part_ins2.rotation_degrees = 270
	part_ins2.emitting = true
	$Sprite.add_child(part_ins2)
	yield(get_tree().create_timer(0.5), "timeout")
	$Sprite.remove_child(part_ins1)
	$Sprite.remove_child(part_ins2)
