extends Robot



func _init() -> void:
	des = ['No', 'Yes', 'A number repeated exactly twice']


func put_answer(a: Answer) -> Array[int]:
	return [a.check_double()]
