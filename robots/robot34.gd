extends Robot



func _init() -> void:
	des = [
		COLOR_NAME[0],
		COLOR_NAME[1],
		COLOR_NAME[2],
		'Which num is one of the smallest',
		]


func put_answer(a: Answer) -> Array[int]:
	var array: Array[int] = []
	var aa: = a.get_array()
	var m: int = aa.min()
	for i in aa.size():
		if aa[i] == m:
			array.append(i)
	return array
