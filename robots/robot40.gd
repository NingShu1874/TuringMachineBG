extends Robot



func _init() -> void:
	des = [
		COLOR_NAME[0] + '-' + COMPARE_NAME[0],
		COLOR_NAME[0] + '-' + COMPARE_NAME[1],
		COLOR_NAME[0] + '-' + COMPARE_NAME[2],
		COLOR_NAME[1] + '-' + COMPARE_NAME[0],
		COLOR_NAME[1] + '-' + COMPARE_NAME[1],
		COLOR_NAME[1] + '-' + COMPARE_NAME[2],
		COLOR_NAME[2] + '-' + COMPARE_NAME[0],
		COLOR_NAME[2] + '-' + COMPARE_NAME[1],
		COLOR_NAME[2] + '-' + COMPARE_NAME[2],
		'A specific numbers compare to 3',
		]

func put_answer(a: Answer) -> Array[int]:
	var array: Array[int] = []
	var aa: = a.get_array()
	for i in aa.size():
		array.append(compare(aa[i], 3) + i * 3)
	return array
