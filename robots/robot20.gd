extends Robot



func _init() -> void:
	des = ['3', '2', '0', 'How many repeat']



func put_answer(a: Answer) -> Array[int]:
	if a.check_single():
		return [2]
	return [not a.check_triple()]
