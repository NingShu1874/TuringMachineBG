# 这个类用于提供合法的答案数组，和一些常用的算式

extends RefCounted

class_name Answer

const SIZE = 3
const MIN_VALUE = 1
const MAX_VALUE = 5


# 答案类的主要职责是管理这个数组
var array: Array[int] = []

# 答案实例必须是合法值
func _init(a: Array) -> void:
	# 输入不合法时记录
	var invalid: = false
	
	# 要求长度为3，元素为1~5
	if a.size() != SIZE:
		invalid = true
	else:
		for i in a:
			if typeof(i) != TYPE_INT or i < MIN_VALUE or i > MAX_VALUE:
				invalid = true
				break
			else:
				array.append(i)
	
	# 输入不合法时得到默认实例并报错
	if invalid:
		push_error('Invalid answer!')
		array = [1, 1, 1]


# 答案会在多个地方被使用，因此数组是只读的
func get_array() -> Array[int]:
	return array.duplicate(true)


# 仅提供对值的合法调用
func get_x() -> int:
	return array[0]


func get_y() -> int:
	return array[1]


func get_z() -> int:
	return array[2]


func count(i: int) -> int:
	return array.count(i)


# 位表示求和，即对某个子集求和
func sum(bit: = 111) -> int:
	var bits: = []
	bits.append(bit / 100)
	bit %= 100
	bits.append(bit / 10)
	bits.append(bit % 10)
	return array[0] * bits[0] + array[1] * bits[1] + array[2] * bits[2]


func find_strictly_min() -> int:
	for i in SIZE:
		if array[i] < array[i - 1] and array[i] < array[i - 2]:
			return i
	return -1


func find_strictly_max() -> int:
	for i in SIZE:
		if array[i] > array[i - 1] and array[i] > array[i - 2]:
			return i
	return -1



func count_odd() -> int:
	return array[0] % 2 + array[1] % 2 + array[2] % 2

func count_even() -> int:
	return SIZE - count_odd()

func check_single() -> bool:
	for i in SIZE:
		if array[i] == array[i - 1]:
			return false
	return true

func check_double() -> bool:
	return not check_single() and not check_triple()


func check_triple() -> bool:
	return array[0] == array[1] and array[1] == array[2]


func check_increasing() -> bool:
	return array[0] < array[1] and array[1] < array[2]

# 除了直接==，另一种判定
func equal(a: Answer) -> bool:
	for i in SIZE:
		if array[i] != a.array[i]:
			return false
	return true


# 生成全部答案的集合
static func all_answer_set() -> Array[Answer]:
	var all: Array[Answer] = []
	for x in range(1, 6):
		for y in range(1, 6):
			for z in range(1, 6):
				all.append(Answer.new([x, y, z]))
	return all
