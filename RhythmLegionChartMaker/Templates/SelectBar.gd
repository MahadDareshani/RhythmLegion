extends Control

export var song_data : String
signal send_song_data(data, difficulty)

func start_game():
	get_parent().get_parent().get_parent().get_parent().get_node("SelectSFX").play()
	connect("send_song_data", get_parent().get_parent().get_parent().get_parent(), "recieve_song_data")
	get_parent().get_parent().get_parent().get_parent().get_node("AnimationPlayer").play("Outro")
	#for node in $Difficulty.get_children():
	#	node.set_mouse_mode = MOUSE_FILTER_IGNORE

func _on_Easy_pressed():
	start_game()
	emit_signal("send_song_data", song_data, "easy")

func _on_Medium_pressed():
	start_game()
	emit_signal("send_song_data", song_data, "medium")

func _on_Hard_pressed():
	start_game()
	emit_signal("send_song_data", song_data, "hard")

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		var bar = get_focus_owner()
		if bar != null:
			bar.pressed = true

func play_kick():
	get_parent().get_parent().get_parent().get_parent().get_node("KickSFX").play()
