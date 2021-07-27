extends KinematicBody2D

export var SPEED:int =200
export var JUMP_HEIGHT:float = -330
export var GRAVITY:float = 20
export var UP:Vector2 = Vector2(0,-1)

export var action = "down"
var coins = 0
var velocity = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	var dynamic_font = DynamicFont.new()
	dynamic_font.font_data = load("res://font/magero.ttf")
	dynamic_font.size = 40
	$Camera2D/HUD/Label.set("custom_fonts/font", dynamic_font)

func _physics_process(_delta):
	$AnimatedSprite.play(move())

func add_coins(amount=1):
	coins += amount
	$Camera2D/HUD/Label.text = str(coins)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func move():
	action = "down"
	velocity.x = 0
	velocity.y += GRAVITY
	
	if Input.is_action_just_pressed("ui_accept") && is_on_floor():
		velocity.y = JUMP_HEIGHT 
	if Input.is_action_pressed("ui_right"):
		velocity.x += SPEED
		action = "right"
	if Input.is_action_pressed("ui_left"):
		velocity.x -= SPEED
		action = "left"
	if Input.is_action_pressed("ui_shift"):
		velocity.x *=2
				
	# Update player position
	move_and_slide(velocity, UP)
	
	if velocity.x > 0:
		return action + "_run"
	return action + "_idle"

func _on_Fallzone_body_entered(body):
	get_tree().change_scene("res://Game.tscn")
