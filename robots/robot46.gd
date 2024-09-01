extends Robot



func _init() -> void:
	des = [
		'0-3',
		'1-3',
		'2-3',
		'3-3',
		'0-4',
		'1-4',
		'2-4',
		'3-4',
		'How many 3 or 4',
		]


func put_answer(a: Answer) -> Array[int]:
	var array: Array[int] = []
	array.append(a.count(3))
	array.append(a.count(4) + 4)
	return array
