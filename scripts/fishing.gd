extends Node2D

@export var circle: Sprite2D
@export var point: Sprite2D
@export var player: Sprite2D

var target
var start 
var tween
var player_rotation = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	## Start RNG
	randomize()
	
	# Set up positions/targets
	while not circle:
		pass
	target = circle.position
	while not point:
		pass
	point.position = Vector2(cos(0) * 300, sin(0) * 300)
	point.rotation = -PI/6

func _process(delta: float) -> void:
	handle_player(delta)
	pass


func handle_player(delta: float) -> void:
	# Rotate right/left
	if Input.is_action_pressed("ui_right"):
		player_rotation += delta * 8
	if Input.is_action_pressed("ui_left"):
		player_rotation -= delta * 8
	if Input.is_action_just_pressed("ui_down"):
		reset_point()
	player.rotation = player_rotation
	player.position = Vector2(cos(player_rotation) * 55, sin(player_rotation) * 55)

func reset_point() -> void:
	var new_rot = randfn(0, 2*PI)
	point.position = Vector2(cos(new_rot)*300, sin(new_rot) * 300)
	point.rotation = new_rot - (PI/6)
	tween = create_tween()
	tween.tween_property(point, "position", Vector2(0,0), 0.80)
	pass
