extends Robot



func _init() -> void:
	des = [
		COLOR_NAME[0],
		COLOR_NAME[1],
		COLOR_NAME[2],
		'Which num is strictly the smallest',
		]


func put_answer(a: Answer) -> Array[int]:
	var i: = a.find_strictly_min()
	if i != -1:
		return [i]
	return []
