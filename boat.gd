extends CharacterBody2D

@export var speed = 400
@onready var animations = $boat/AnimationPlayer

func get_input():
	var input_direction = Input.get_vector("LEFT", "RIGHT", "UP", "DOWN")
	velocity = input_direction * speed

func updateAnimation():
	var direction = "down"
	if (velocity.x < 0) && (velocity.y > 0): direction = "down_left"
	elif (velocity.x > 0) && (velocity.y > 0): direction = "down_right"
	elif (velocity.x < 0) && (velocity.y < 0): direction = "up_left"
	elif (velocity.x > 0) && (velocity.y < 0): direction = "up_right"
	elif (velocity.y < 0): direction = "up"
	elif (velocity.x > 0):direction = "right"
	elif (velocity.x < 0): direction = "left" 
	
	animations.play(direction)

func _physics_process(_delta: float) -> void:
	get_input()
	move_and_slide()
	updateAnimation()
