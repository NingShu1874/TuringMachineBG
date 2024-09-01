extends Robot



func _init() -> void:
	des = [
		COMPARE_NAME[0],
		COMPARE_NAME[1],
		COMPARE_NAME[2],
		'Bule add yellow compared to 6',
		]

func put_answer(a: Answer) -> Array[int]:
	return [compare(a.sum(110), 6)]
