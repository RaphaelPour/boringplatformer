extends KinematicBody2D

export var speed=200
export var action = "down"
export var coins = 0
var velocity = Vector2.ZERO

export var JUMP_HEIGHT:float = -300
export var GRAVITY:float = 15

# Called when the node enters the scene tree for the first time.
func _ready():
	var dynamic_font = DynamicFont.new()
	dynamic_font.font_data = load("res://font/magero.ttf")
	dynamic_font.size = 64
	$Camera2D/HUD/Label.set("custom_fonts/font", dynamic_font)

func _process(_delta):
	$AnimatedSprite.play(move())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func move():
	
	action = "down"
	velocity.x = 0
	velocity.y += GRAVITY
	
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_HEIGHT 
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
		action = "right"
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed
		action = "left"
	if Input.is_action_pressed("ui_shift"):
		velocity.x *=2
				
	# Update player position
	move_and_slide(velocity)

	if velocity.x > 0:
		return action + "_run"
	return action + "_idle"
