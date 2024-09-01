extends Robot



func _init() -> void:
	des = [
		COMPARE_NAME[2],
		COMPARE_NAME[0],
		'Even compared to odd',
		]


func put_answer(a: Answer) -> Array[int]:
	return [a.count_odd() > 1]
