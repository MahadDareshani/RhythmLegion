extends Area2D

# FIND DISTANCE
const TARGET_Y = 584
const SPAWN_Y = -64
const DIST_TO_TARGET = TARGET_Y - SPAWN_Y

# PLAYER 1 SPAWNXS
const P1_LEFT_LANE_SPAWN = Vector2(480, SPAWN_Y)
const P1_CENTRE_LANE_SPAWN = Vector2(640, SPAWN_Y)
const P1_RIGHT_LANE_SPAWN = Vector2(800, SPAWN_Y)

# OTHER VARS
var speed = 0
var hit = false

func _physics_process(delta):
	if !hit:
		position.y += speed * delta
		if position.y > 648:
			queue_free()
	else:
		$Node2D.position.y -= speed * delta
		$Node2D.modulate.a -= speed * delta * 0.01

func P1_initialize(lane):
	$AnimatedSprite.flip_h = false
	if lane == 0:
		set_lane(0, "df3e23", P1_LEFT_LANE_SPAWN)
	elif lane == 1:
		set_lane(1, "d6f264", P1_CENTRE_LANE_SPAWN)
	elif lane == 2:
		set_lane(2, "20d6c7", P1_RIGHT_LANE_SPAWN)
	else:
		printerr("Invalid lane set for note: " + str(lane))
		return
	
	speed = DIST_TO_TARGET / 2.0
	$VFX.hide()
	$Particles.hide()

func set_lane(frame, mod, pos):
	$AnimatedSprite.frame = frame
	$VFX.modulate = mod
	$Particles.modulate = mod
	$Node2D/Label.add_color_override("font_color", mod)
	position = pos

func destroy(score):
	$CollisionShape2D.set_deferred("disabled", true)
	$VFX.show()
	$Particles.show()
	$VFX/AnimationPlayer.play("Idle")
	$Particles.emitting = true
	$AnimatedSprite.visible = false
	$Timer.start()
	hit = true
	if score == 3:
		$Node2D/Label.text = "PERFECT"
		$Node2D/Label.modulate = Color("f6d6bd")
	elif score == 2:
		$Node2D/Label.text = "GOOD"
		$Node2D/Label.modulate = Color("c3a38a")
	elif score == 1:
		$Node2D/Label.text = "OKAY"
		$Node2D/Label.modulate = Color("997577")

func _on_Timer_timeout():
	queue_free()
