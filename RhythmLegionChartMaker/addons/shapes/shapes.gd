tool
extends EditorPlugin


func _enter_tree():
	add_custom_type("ShapeSprite", "Sprite", preload("res://addons/shapes/shapescript.gd"), preload("res://addons/shapes/square_icon.png"))
	add_custom_type("Vignette", "ColorRect", preload("res://addons/shapes/vignette.gd"), preload("res://addons/shapes/vignette_icon.png"))

func _exit_tree():
	remove_custom_type("ShapeSprite")
	remove_custom_type("Vignette")
