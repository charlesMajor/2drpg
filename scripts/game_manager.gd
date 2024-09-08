extends Node

@onready var camera_cafe: Camera2D = $"../CameraCafe"
@onready var camera_kitchen: Camera2D = $"../CameraKitchen"

func _ready():
	camera_cafe.make_current()

func _process(delta):
	if Input.is_action_just_pressed("action"):
		print("switch camera")
		if !camera_cafe.is_current():
			camera_cafe.make_current()
		else:
			camera_kitchen.make_current()
