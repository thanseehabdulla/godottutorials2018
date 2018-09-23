extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

const GRAVITY = 20

const JUMP = -500

const WALK_SPEED = 200

const ACCELERATION = 50

var speed = 250

var velocity = Vector2()

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _physics_process(delta):
	velocity.y += GRAVITY
	
	var friction = false
	
	
	if Input.is_action_pressed("ui_right"):
		#velocity.x += ACCELERATION
		velocity.x = min(velocity.x + ACCELERATION, WALK_SPEED)
	elif Input.is_action_pressed("ui_left"):
		#velocity.x -= ACCELERATION
		velocity.x = max(velocity.x - ACCELERATION, -WALK_SPEED)
	else:
		velocity.x = 0
		friction = true
		
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = JUMP
		if friction == true:
			velocity.x = lerp(velocity.x,0,0.2)
	
	move_and_slide(velocity,Vector2(0,-1))
	pass
