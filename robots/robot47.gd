extends Robot



func _init() -> void:
	des = [
		'0-1',
		'1-1',
		'2-1',
		'3-1',
		'0-4',
		'1-4',
		'2-4',
		'3-4',
		'How many 1 or 4',
		]


func put_answer(a: Answer) -> Array[int]:
	var array: Array[int] = []
	array.append(a.count(1))
	array.append(a.count(4) + 4)
	return array
