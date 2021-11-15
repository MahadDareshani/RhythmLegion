extends Node

var ended = false
var beat1a = 0
var beat1b = 0
var beat1c = 0
var beat1d = 0
var beat2a = 0
var beat2b = 0
var beat2c = 0
var beat2d = 0
var beat3a = 0
var beat3b = 0
var beat3c = 0
var beat3d = 0
var beat4a = 0
var beat4b = 0
var beat4c = 0
var beat4d = 0

var bpm = 140
var offset = 24
var temp_position
var end_beat = 10000
var volume = 0

onready var chart_song = preload("res://Templates/Song.ogg")
onready var song_bar   = preload("res://Templates/SelectBar.tscn")

func song(song_position_in_beats):
	temp_position = (song_position_in_beats) - 16
	play_song()

func bar(value):
	return value*16

func set_beat(beat_num ,beatA,beatB,beatC,beatD):
	set("beat" + str(beat_num) + "a", beatA)
	set("beat" + str(beat_num) + "b", beatB)
	set("beat" + str(beat_num) + "c", beatC)
	set("beat" + str(beat_num) + "d", beatD)


func play_song():
	if temp_position > 0:
		set_beat(1, 1, 0, 0, 0)
		set_beat(2, 1, 0, 0, 0)
		set_beat(3, 1, 0, 0, 0)
		set_beat(4, 1, 0, 0, 0)
	if temp_position > bar(end_beat):
		set_beat(1, 0, 0, 0, 0)
		set_beat(2, 0, 0, 0, 0)
		set_beat(3, 0, 0, 0, 0)
		set_beat(4, 0, 0, 0, 0)
	if temp_position > (bar(end_beat) + 6):
		ended = true
