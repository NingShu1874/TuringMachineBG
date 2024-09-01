extends Robot



func _init() -> void:
	des = ['0', '1', '2', '3', 'How many 3']




func put_answer(a: Answer) -> Array[int]:
	return [a.count(3)]
