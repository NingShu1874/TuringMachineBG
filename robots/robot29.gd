extends Robot



func _init() -> void:
	des = [
		COLOR_NAME[0],
		COLOR_NAME[1],
		COLOR_NAME[2],
		'A specific number is equal to 3',
		]


func put_answer(a: Answer) -> Array[int]:
	var array: Array[int] = []
	if a.get_x() == 3:
		array.append(0)
	if a.get_y() == 3:
		array.append(1)
	if a.get_z() == 3:
		array.append(2)
	
	return array
