extends Label



func _on_Sprite_speed_change(new_speed):
	print("desde label")
	text = str(new_speed)
