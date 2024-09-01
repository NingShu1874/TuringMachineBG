extends Robot



func _init() -> void:
	des = [
		COLOR_NAME[0] + '-' + COLOR_NAME[1],
		COLOR_NAME[0] + '-' + COLOR_NAME[2],
		COLOR_NAME[1] + '-' + COLOR_NAME[2],
		'Two specific numbers have a sum of 6',
		]

func put_answer(a: Answer) -> Array[int]:
	var array: Array[int] = []
	if a.sum(110) == 6:
		array.append(0)
	if a.sum(101) == 6:
		array.append(1)
	if a.sum(011) == 6:
		array.append(2)
	return array
