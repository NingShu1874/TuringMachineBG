extends Robot



func _init() -> void:
	des = [
		PARITY_NAME[0],
		PARITY_NAME[1],
		'Purple\'s parity',
		]


func put_answer(a: Answer) -> Array[int]:
	return [a.get_z() % 2]
