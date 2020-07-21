extends Area2D

signal hit

export var speed = 800
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	hide()
	
func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("key_right"):
		velocity.x += 1
	if Input.is_action_pressed("key_left"):
		velocity.x -= 1
	if Input.is_action_pressed("key_down"):
		velocity.y += 1
	if Input.is_action_pressed("key_up"):
		velocity.y -= 1
	else:
		$AnimatedSprite.stop()
	
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

	if velocity.x !=0:
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y !=0:
		$AnimatedSprite.animation ="up"
		$AnimatedSprite.flip_v = velocity.y > 0
		
	if velocity.x < 0:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
