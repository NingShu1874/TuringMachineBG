extends Robot



func _init() -> void:
	des = [
		COLOR_NAME[0] + '-' + COLOR_NAME[1] + '-' + COMPARE_NAME[0],
		COLOR_NAME[0] + '-' + COLOR_NAME[1] + '-' + COMPARE_NAME[1],
		COLOR_NAME[0] + '-' + COLOR_NAME[1] + '-' + COMPARE_NAME[2],
		COLOR_NAME[0] + '-' + COLOR_NAME[2] + '-' + COMPARE_NAME[0],
		COLOR_NAME[0] + '-' + COLOR_NAME[2] + '-' + COMPARE_NAME[1],
		COLOR_NAME[0] + '-' + COLOR_NAME[2] + '-' + COMPARE_NAME[2],
		'Blue compare to a specific number',
		]


func put_answer(a: Answer) -> Array[int]:
	var array: Array[int] = []
	array.append(compare(a.get_x(), a.get_y()))
	array.append(compare(a.get_x(), a.get_z()) + 3)
	return array
