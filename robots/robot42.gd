extends Robot



func _init() -> void:
	des = [
		COLOR_NAME[0] + '-Min',
		COLOR_NAME[0] + '-Max',
		COLOR_NAME[1] + '-Min',
		COLOR_NAME[1] + '-Max',
		COLOR_NAME[2] + '-Min',
		COLOR_NAME[2] + '-Max',
		'Which num is strictly the smallest or the largest',
		]


func put_answer(a: Answer) -> Array[int]:
	var array: Array[int] = []
	var i: = a.find_strictly_min()
	if i != -1:
		array.append(i * 2)
	var j: = a.find_strictly_max()
	if j != -1:
		array.append(j * 2 + 1)
	return array
