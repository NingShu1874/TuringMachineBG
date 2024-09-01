extends Robot



func _init() -> void:
	des = [
	'Ascending',
	'Descending',
	'Unordered',
	'The order of 3 numbers',
	]



func put_answer(a: Answer) -> Array[int]:
	if a.get_x() < a.get_y() and a.get_y() < a.get_z():
		return [0]
	var i: = int(a.get_x() > a.get_y() and a.get_y() > a.get_z())
	return [2 - i]
