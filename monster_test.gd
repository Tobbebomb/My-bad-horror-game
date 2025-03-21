extends CharacterBody3D

var player = null

@export var player_path : NodePath

@onready var nav_agent = $Test/NavigationAgent3D

const SPEED = 3.0

func _ready():
	player = get_node(player_path)


func _physics_process(delta):
	velocity = Vector3.ZERO
	
	#navigation
	nav_agent.set_target_position(player.global_transform.origin)
	var next_nav_point = nav_agent.get_next_path_position()
	velocity = (next_nav_point - global_transform.origin).normalized() * SPEED
	
	look_at(Vector3(player.global_position.x, global_position.y, player.global_position.z), Vector3.UP)
	
	move_and_slide()
