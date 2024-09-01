extends Robot



func _init() -> void:
	des = ['0', '1', '2', '3', 'How many 4']



func put_answer(a: Answer) -> Array[int]:
	return [a.count(4)]
