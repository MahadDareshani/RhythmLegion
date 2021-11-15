extends Node

var song_position = 0.0
var song_position_in_beats = 0
var last_spawned_beat = 0
var sec_per_beat

var spawn_1a_beat = 0
var spawn_1b_beat = 0
var spawn_1c_beat = 0
var spawn_1d_beat = 0
var spawn_2a_beat = 0
var spawn_2b_beat = 0
var spawn_2c_beat = 0
var spawn_2d_beat = 0
var spawn_3a_beat = 0
var spawn_3b_beat = 0
var spawn_3c_beat = 0
var spawn_3d_beat = 0
var spawn_4a_beat = 0
var spawn_4b_beat = 0
var spawn_4c_beat = 0
var spawn_4d_beat = 0

var lane = 0
var rand = 0
var note = preload("res://NotesArrows/Note.tscn")
var P1_instance
var P2_instance

func _ready():
	randomize()
	$Conductor.stream = $SongScriptHolder.chart_song
	$Conductor.bpm = $SongScriptHolder.bpm
	$Conductor.offset = $SongScriptHolder.offset
	$Conductor.sec_per_beat = (15.0 / $Conductor.bpm)
	sec_per_beat = $Conductor.sec_per_beat
	
	$Conductor.play_with_beat_offset($Conductor.offset + 16)
	#get_parent().get_node("Conductor").play_from_beat(55 * 16, offset + 16)


func _on_Conductor_measure(position):
	if position == 1:
		_spawn_notes(spawn_1a_beat)
	elif position == 2:
		_spawn_notes(spawn_1b_beat)
	elif position == 3:
		_spawn_notes(spawn_1c_beat)
	elif position == 4:
		_spawn_notes(spawn_1d_beat)
	elif position == 5:
		_spawn_notes(spawn_2a_beat)
	elif position == 6:
		_spawn_notes(spawn_2b_beat)
	elif position == 7:
		_spawn_notes(spawn_2c_beat)
	elif position == 8:
		_spawn_notes(spawn_2d_beat)
	elif position == 9:
		_spawn_notes(spawn_3a_beat)
	elif position == 10:
		_spawn_notes(spawn_3b_beat)
	elif position == 11:
		_spawn_notes(spawn_3c_beat)
	elif position == 12:
		_spawn_notes(spawn_3d_beat)
	elif position == 13:
		_spawn_notes(spawn_4a_beat)
	elif position == 14:
		_spawn_notes(spawn_4b_beat)
	elif position == 15:
		_spawn_notes(spawn_4c_beat)
	elif position == 16:
		_spawn_notes(spawn_4d_beat)

func _on_Conductor_beat(position):
	song_position_in_beats = position
	if $SongScriptHolder.ended == false:
		$SongScriptHolder.song(song_position_in_beats)
		spawn_1a_beat = $SongScriptHolder.beat1a
		spawn_1b_beat = $SongScriptHolder.beat1b
		spawn_1c_beat = $SongScriptHolder.beat1c
		spawn_1d_beat = $SongScriptHolder.beat1d
		spawn_2a_beat = $SongScriptHolder.beat2a
		spawn_2b_beat = $SongScriptHolder.beat2b
		spawn_2c_beat = $SongScriptHolder.beat2c
		spawn_2d_beat = $SongScriptHolder.beat2d
		spawn_3a_beat = $SongScriptHolder.beat3a
		spawn_3b_beat = $SongScriptHolder.beat3b
		spawn_3c_beat = $SongScriptHolder.beat3c
		spawn_3d_beat = $SongScriptHolder.beat3d
		spawn_4a_beat = $SongScriptHolder.beat4a
		spawn_4b_beat = $SongScriptHolder.beat4b
		spawn_4c_beat = $SongScriptHolder.beat4c
		spawn_4d_beat = $SongScriptHolder.beat4d
	if $SongScriptHolder.ended == true:
		end_game()

func end_game():
	$Conductor.stop()
	
	yield(get_tree().create_timer(2.0), "timeout")
	
	get_tree().reload_current_scene()

func _spawn_notes(to_spawn):
	if to_spawn > 0:
		lane = randi() % 3
		
		P1_instance = note.instance()
		$Notes.add_child(P1_instance)
		P1_instance.P1_initialize(lane)
	if to_spawn > 1:
		while rand == lane:
			rand = randi() % 3
		lane = rand
		
		P1_instance = note.instance()
		P1_instance.P1_initialize(lane)
		$Notes.add_child(P1_instance)
