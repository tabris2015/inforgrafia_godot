extends Sprite

var angular_speed = 2
var speed = 500
var max_speed = 600
var boton_inc_speed 
var estado_label

# se;ales
signal speed_change(new_speed)


func _ready():
	boton_inc_speed = get_parent().get_node("Inc_speed")
	estado_label = get_parent().get_node("estado")
	
	var timer = get_parent().get_node("Timer")
	timer.connect("timeout", self, "_on_timer_timeout")
	print(boton_inc_speed.text)
	
func _on_timer_timeout():
	print("ha pasado 1 segundo!")
	visible = not visible


func _process(delta):
	var direction = 0
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_left"):
		direction = -1
	if Input.is_action_pressed("ui_right"):
		direction = 1
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2.UP.rotated(rotation) * speed
	if Input.is_action_pressed("ui_down"):
		velocity = -Vector2.UP.rotated(rotation) * speed
	
	rotation += angular_speed * direction * delta
	
	position += velocity * delta
	
	
func _on_Inc_speed_button_up():
	speed += 50
	if speed > max_speed:
		speed = max_speed
	#estado_label.text = str(speed)
	emit_signal("speed_change", speed)

func _on_Dec_speed_button_up():
	speed -= 50
	if speed < 0:
		speed = 0
