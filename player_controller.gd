extends CharacterBody2D
class_name PlayerController

@export var speed: float = 100.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var input_direction := Input.get_vector("Left", "Right", "Top", "Bottom")

	velocity = input_direction * speed
	move_and_slide()

	if input_direction != Vector2.ZERO:
		sprite.play("walk")
		if input_direction.x != 0:
			sprite.flip_h = input_direction.x < 0
	else:
		sprite.play("idle")
