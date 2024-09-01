# 这个类用于管理机器人卡牌，每张卡牌都有2到9个判定，和其描述
extends RefCounted

class_name Robot

# 脚本数
const ROBOT_COUNT = 22
const ROBOT_OUTSET = 1
# 脚本地址
const ROBOT_PATH = "res://robots/robot%s.gd"

# 常用文本
const COLOR_NAME = ['Blue', 'Yellow', 'Purple']
const COMPARE_NAME = ['Less', 'Equal', 'Greater']
const PARITY_NAME = ['Even', 'Odd']
const NOT_IN = 'Not in'

# 判定数，除了初始化，不允许修改
var num: = -1
# 所选判定子集的序号
var index: = -1
# 机器人名，也就是卡上的标号，在实例化的时候由调用者设置
var name: = -1
# 描述，在各继承脚本中配置
var des: Array[String]
# 机器人的影分身，对应每一个子集，本体index=-1，可用机器人都在这里
var clone: Array[Robot] = []

# 初始化将全部答案和对应编号数组存入
var answer_set: Dictionary

func get_num() -> int:
	return num


func r_print() -> void:
	prints('Robot', name, ':', des[-1], '-', des[index])
	return


# 把大小关系变成0，1，2
func compare(x: int, y: int) -> int:
	if x < y:
		return 0
	if x == y:
		return 1
	return 2



# 判定接口，一次性给出答案在哪些子集中，因为子集可能不互斥，所以返回数组
func put_answer(a: Answer) -> Array[int]:
	return [-1]


# 查找函数，生成问题时不再反复判定，直接获得答案集和各子集的交集
func find_answer(a: Answer) -> Array[int]:
	return answer_set[a]


# 可用机器人检查答案
func check_answer(a: Answer) -> bool:
	# 确保调用合法
	if index == -1:
		push_error('Invalid index.')
		return false
	return index in answer_set[a]


# 加载全部机器人
static func all_robot_set(all_a: Array[Answer]) -> Array[Robot]:
	var all_r: Array[Robot] = []
	
	# 需要手动指定脚本数
	for i in range(ROBOT_OUTSET, ROBOT_COUNT + 1):
		# 没找到脚本，停止
		var script: GDScript = load(ROBOT_PATH % i)
		if not script:
			break
		
		# 脚本里不是robot，停止
		var r = script.new()
		if not r is Robot:
			break
		
		# 初始化robot，本函数是机器人唯一的合法初始化途径
		# des里去掉题干是判定数
		r.num = r.des.size() - 1
		r.name = i
		r.answer_set = {}
		
		# 建立全答案集的映射
		for a in all_a:
			r.answer_set[a] = r.put_answer(a)
		
		# 制作全判定的克隆机器人
		for j in r.num:
			var jr = script.new()
			jr.index = j
			jr.num = r.num
			jr.name = r.name
			jr.clone = r.clone
			jr.answer_set = r.answer_set
			r.clone.append(jr)
		
		all_r.append(r)
	
	if all_r.size() != ROBOT_COUNT - ROBOT_OUTSET + 1:
		push_error('Not enough robots!')
	
	check_robot_set(all_r)
	return all_r

# 检查机器人配置是否正确
# 打印格式如下
#region prit_format
 #Robot 14 : Which num is strictly the smallest
 #Not in : 35 [1, 1, 1]
 #Blue : 30 [1, 2, 2]
 #Yellow : 30 [2, 1, 2]
 #Purple : 30 [2, 2, 1]
#endregion
static func check_robot_set(all_r: Array[Robot]) -> bool:
	var correct: = true
	# 打印机器人
	for r in all_r:
		var keys: = r.answer_set.keys()
		if keys.size() != 125:
			push_error('Invalide answer_set.')
			correct = false
		prints('Robot', r.name, ':', r.des[-1])
		
		# 统计子集
		var counts: Array[int] = []
		var exams: Array[Answer] = []
		counts.resize(r.num + 1)
		exams.resize(r.num + 1)
		for a in keys:
			var index_array: Array[int] = r.answer_set[a]
			if index_array.size() == 0:
				counts[-1] += 1
				if counts[-1] == 1:
					exams[-1] = a
			else:
				for i in index_array:
					counts[i] += 1
					if counts[i] == 1:
						exams[i] = a
		
		# 打印子集
		for i in r.num:
			var set_name: = r.des[i] if r.des[i].length() > 4 else r.des[i] + '    '
			printt(set_name, ':', counts[i], exams[i].get_array())
		if counts[-1] != 0:
			printt(NOT_IN, ':', counts[-1], exams[-1].get_array())
		
		# 打印间隔
		print()
	return correct


# 序列化Question时调用
static func robot_to_array(r: Robot) -> Array[int]:
	return [r.name, r.index]


# 反序列化Question时调用
# 合法的转化需要2d坐标在全机器人数组中有对应值
static func array_to_robot(a: Array[int], all_r: Array[Robot]) -> Robot:
	if a.size() == 2:
		if a[0] >= ROBOT_OUTSET and a[0] <= ROBOT_COUNT:
			var r: = all_r[a[0] - ROBOT_OUTSET]
			if a[1] >= 0 and a[1] < r.num:
				return r.clone[a[1]]
	push_error('Invalid array.')
	return
