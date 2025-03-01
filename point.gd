extends Node2D

var points: int = 0
var playing = true

func setup_point(point_value: int):
	points = point_value
	pass

func _ready() -> void:
	# Select random rotation
	var tween = create_tween()
	var new_rot = randfn(0, 2*PI)
	# Set position and rotation according to the random rotation
	self.position = Vector2(cos(new_rot)*300, sin(new_rot) * 300)
	self.rotation = new_rot - (PI/6)
	
	# Create tween between an execute it
	while not tween:
		pass
	if playing:
		tween.tween_property(self, "position", Vector2(0,0), 0.72)
		tween.tween_callback(_ready)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
