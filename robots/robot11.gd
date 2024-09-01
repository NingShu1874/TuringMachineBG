extends Robot



func _init() -> void:
	des = [
		COMPARE_NAME[0],
		COMPARE_NAME[1],
		COMPARE_NAME[2],
		'Blue compared to yellow',
		]



func put_answer(a: Answer) -> Array[int]:
	return [compare(a.get_x(), a.get_y())]
