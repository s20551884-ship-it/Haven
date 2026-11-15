extends Node2D

@export var player_controller : PlayerController
@export var animation_player : AnimationPlayer
@export var sprite : Sprite2D

func _process(_delta):
	if player_controller == null or animation_player == null:
		return

	var v = player_controller.velocity

	if v == Vector2.ZERO:
		animation_player.stop()   # or play("Idle") if you have one
		return

	# Use whichever direction is stronger so animations don't fight each other
	if abs(v.x) > abs(v.y):
		if v.x > 0:
			animation_player.play("Right")
		else:
			animation_player.play("Left")
	else:
		if v.y < 0:
			animation_player.play("Top")      # moving up
		else:
			animation_player.play("Bottom")   # moving down
