extends Robot



func _init() -> void:
	des = [
		COLOR_NAME[0],
		COLOR_NAME[1],
		COLOR_NAME[2],
		'A specific number is equal to 1',
		]


func put_answer(a: Answer) -> Array[int]:
	var array: Array[int] = []
	if a.get_x() == 1:
		array.append(0)
	if a.get_y() == 1:
		array.append(1)
	if a.get_z() == 1:
		array.append(2)
	
	return array
