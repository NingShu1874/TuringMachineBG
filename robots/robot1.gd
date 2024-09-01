extends Robot



func _init() -> void:
	des = [
		COMPARE_NAME[1],
		COMPARE_NAME[2],
		'Bule compared to 1',
		]


func put_answer(a: Answer) -> Array[int]:
	return [compare(a.get_x(), 1) - 1]
