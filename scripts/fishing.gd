extends Node2D

@export var circle: Sprite2D
@export var point: Sprite2D
@export var player: Sprite2D

var target = Vector2(550, 250)
var start = target + Vector2(300, cos(-PI/3)*300)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Put point at starting position and make it blue (r, g, b)
	point.position = start
	point.modulate = Color(0, 0, 1)
	pass # Replace with function body.

# Start rotation at 0 rad
var rot = 0
var player_distance = 55

# Create tween object
var tween = create_tween()

func _process(delta: float) -> void:
	# Set player position to the outside of the middle at the radian angle rot
	player.position = Vector2(cos(rot) * player_distance, sin(rot) * player_distance) + target
	player.rotation = rot
	
	# Tween point to the middle circle (obj, property, target pos, time in sec
	tween.tween_property(point, "position", target, 1)

	# Once tween finishes, change color to red
	tween.tween_callback(func(): point.modulate = Color(1,0,0))
	
	rotate_player(delta)
	



func rotate_player(delta: float) -> void:
	# Rotate right/left
	if Input.is_action_pressed("ui_right"):
		rot += delta * 8
	if Input.is_action_pressed("ui_left"):
		rot -= delta * 8
