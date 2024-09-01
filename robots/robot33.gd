extends Robot



func _init() -> void:
	des = [
		COLOR_NAME[0] + '-' + PARITY_NAME[0],
		COLOR_NAME[0] + '-' + PARITY_NAME[1],
		COLOR_NAME[1] + '-' + PARITY_NAME[0],
		COLOR_NAME[1] + '-' + PARITY_NAME[1],
		COLOR_NAME[2] + '-' + PARITY_NAME[0],
		COLOR_NAME[2] + '-' + PARITY_NAME[1],
		'A specific number\'s parity',
		]


func put_answer(a: Answer) -> Array[int]:
	var array: Array[int] = []
	var aa: = a.get_array()
	for i in aa.size():
		array.append(aa[i] % 2 + i * 2)
	return array
