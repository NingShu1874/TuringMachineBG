extends Robot



func _init() -> void:
	des = [
	'3',
	'2',
	'0',
	'How many consecutive ascending or consecutive descending',
	]



func put_answer(a: Answer) -> Array[int]:
	if (a.get_z() - a.get_y() == 1 and a.get_y() - a.get_x() == 1) \
	or (a.get_z() - a.get_y() == -1 and a.get_y() - a.get_x() == -1):
		return [0]
	
	var i: = int(
	a.get_z() - a.get_y() == 1 \
	or a.get_y() - a.get_x() == 1 \
	or a.get_z() - a.get_y() == -1 \
	or a.get_y() - a.get_x() == -1 \
	)
	return [2 - i]
