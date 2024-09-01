extends Robot



func _init() -> void:
	des = [
		'3',
		'4',
		'5',
		'What is the sum a multiple of',
		]


func put_answer(a: Answer) -> Array[int]:
	var array: Array[int] = []
	var s: int = a.sum()
	for i in 3:
		if s % (i + 3) == 0:
			array.append(i)
	return array
