extends KinematicBody

onready var left_b = get_node("Camera/UIControl/LeftButton")
onready var right_b = get_node("Camera/UIControl/RightButton")
onready var button_timer = get_node("Camera/UIControl/ButtonTimer")
var current_angle = Vector3();
var target_rotation = Vector3();
export var speed = 3.0;

func _process(delta):
	rotation_degrees = Vector3(0,lerp(rotation_degrees.y,target_rotation.y,speed*delta),0)

func _on_RightButton_pressed():
	target_rotation = target_rotation -  Vector3(0,90,0)
	left_b.hide()
	right_b.hide()
	button_timer.start()

func _on_LeftButton_pressed():
	target_rotation = target_rotation +  Vector3(0,90,0)
	left_b.hide()
	right_b.hide()
	button_timer.start()

func _on_ButtonTimer_timeout():
	left_b.show()
	right_b.show()
