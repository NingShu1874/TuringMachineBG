extends Robot



func _init() -> void:
	des = [
		PARITY_NAME[0],
		PARITY_NAME[1],
		'Yellow\'s parity',
		]


func put_answer(a: Answer) -> Array[int]:
	return [a.get_y() % 2]
