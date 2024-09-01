extends Robot



func _init() -> void:
	des = [
		COMPARE_NAME[0],
		COMPARE_NAME[1],
		COMPARE_NAME[2],
		'Yellow compared to 4',
		]


func put_answer(a: Answer) -> Array[int]:
	return [compare(a.get_y(), 4)]
