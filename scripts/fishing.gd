extends Node2D

@export var circle: Sprite2D
@export var player: Sprite2D
@export var p_num: int

var target
var start 
var player_rotation = 0
var curr_points = 0
@onready var playing = true

func _ready() -> void:
	# Start RNG
	randomize()
	# Start that tang
	reset_point()
	
	# Set up positions/targets
	while not circle:
		pass
	target = circle.position

func _process(delta: float) -> void:
	handle_player(delta)
	pass


func handle_player(delta: float) -> void:
	# Rotate right/left
	if p_num == 0:
		if Input.is_action_pressed("p1 right"):
			player_rotation += delta * 8
		if Input.is_action_pressed("p1 left"):
			player_rotation -= delta * 8
	elif p_num == 1:
		if Input.is_action_pressed("p2 right"):
			player_rotation += delta * 8
		if Input.is_action_pressed("p2 left"):
			player_rotation -= delta * 8
	
	if !playing and Input.is_action_just_pressed("space"):
		get_tree().change_scene_to_file("res://boating.tscn")
	
	# Set player postion and rotation
	player.rotation = player_rotation
	player.position = Vector2(cos(player_rotation) * 55, sin(player_rotation) * 55)


var scene = preload("res://point.tscn")

func reset_point() -> void:
	# Create an instance of the point and add it as a child to the middle circle
	if playing:
		var instance = scene.instantiate()
		instance.setup_point(1)
		$Middle.add_child(instance)

func stop_it():
	playing = false
	pass

func _on_player_area_area_entered(area: Area2D) -> void:
	# Get points from point scene
	var got_points = area.get_parent().get_parent().points
	# Kill the bitch
	area.get_parent().get_parent().queue_free()
	if playing:
		reset_point()
	# Add points to current score
	curr_points += got_points
	print(curr_points)
	pass # Replace with function body.
