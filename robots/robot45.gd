extends Robot



func _init() -> void:
	des = [
		'0-1',
		'1-1',
		'2-1',
		'3-1',
		'0-3',
		'1-3',
		'2-3',
		'3-3',
		'How many 1 or 3',
		]


func put_answer(a: Answer) -> Array[int]:
	var array: Array[int] = []
	array.append(a.count(1))
	array.append(a.count(3) + 4)
	return array
