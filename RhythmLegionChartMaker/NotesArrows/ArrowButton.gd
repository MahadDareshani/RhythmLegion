extends AnimatedSprite

enum {NEWBIE, NOVICE, AMATEUR, EXPERT, MASTER}

var perfect = false
var good = false
var okay = false
var ai_loc = false

var current_note = null
var notes = []
var can_input = true

var AI
var input

var lane = 0

export(String, "Left", "Right", "Up") var dir = "Left"
export var P1_not_P2 := true

onready var mainscript = get_parent().get_parent()

func _ready():
	randomize()
	
	init_input()
	
	match dir:
		"Left":
			lane = 0
		"Up":
			lane = 1
		"Right":
			lane = 2

func _process(_delta):
	if notes != []:
		if is_instance_valid(notes[0]):
			current_note = notes[0]
		else:
			notes.remove(0)

func _unhandled_input(event):
	if not AI:
		arrow_inputer(event)

func _on_PerfectArea_area_entered(area):
	if area.is_in_group("note"):
		perfect = true

func _on_PerfectArea_area_exited(area):
	if area.is_in_group("note"):
		perfect = false

func _on_GoodArea_area_entered(area):
	if area.is_in_group("note"):
		good = true

func _on_GoodArea_area_exited(area):
	if area.is_in_group("note"):
		good = false

func _on_OkayArea_area_entered(area):
	if area.is_in_group("note"):
		okay = true
		notes.append(area)

func _on_OkayArea_area_exited(area):
	if area.is_in_group("note"):
		okay = false
		notes.erase(0)

func _on_AIArea_area_entered(area):
	if area.is_in_group("note"):
		ai_loc = true

func _on_AIArea_area_exited(area):
	if area.is_in_group("note"):
		ai_loc = false

func _on_PushTimer_timeout():
	frame = 0

func _reset():
	notes.remove(0)
	current_note = null
	perfect = false
	good = false
	okay = false
	ai_loc = false

func arrow_inputer(event):
	if input != "":
		if input != null:
			if event.is_action(input):
				if event.is_action_pressed(input, false):
					check_arrow_pos()
				if event.is_action_pressed(input):
					frame = 1
				elif event.is_action_released(input):
					$PushTimer.start()

func check_arrow_pos():
	if current_note != null:
		if perfect:
			current_note.destroy(3)
		elif good:
			current_note.destroy(2)
		elif okay:
			current_note.destroy(1)
		_reset()

func init_input():
	input = str(dir)
