extends Control

@export var P1: Node2D
@export var P2: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Return.text = ""
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$P1Score.text = str(P1.curr_points)
	$P2Score.text = str(P2.curr_points)
	$Timer.text = str(floor($TimerThing.time_left))


func _on_timer_thing_timeout() -> void:
	print("TIOMERE DONE")
	P1.stop_it()
	P2.stop_it()
	$Return.text = "Press Space To Return"
	pass # Replace with function body.
