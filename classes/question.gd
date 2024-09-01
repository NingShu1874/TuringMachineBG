extends RefCounted

class_name Question

const MAX_ROBOT_NUM = 6
const MIN_ROBOT_NUM = 3

const QUESTION_PATH = "res://questions/questions.txt"

var robots: Array[Robot] = []
var answers: Array[Answer] = []


func ask_robot(a: Answer, i: int) -> bool:
	if i < 0 or i > robots.size() - 1:
		push_error('Invalid index.')
		return false
	return robots[i].check_answer(a)


func check_answer(a: Answer) -> bool:
	for r in robots:
		if not r.check_answer(a):
			return false
	return true


func dup_append(r: Robot) -> Question:
	var q: = Question.new()
	q.robots = robots.duplicate()
	q.robots.append(r)
	for a in answers:
		if r.check_answer(a):
			q.answers.append(a)
	return q
	

func branches_append(r: Robot) -> Array[Question]:
	var qs: Array[Question] = []
	for rc in r.clone:
		var q: = Question.new()
		q.robots = robots.duplicate()
		q.robots.append(rc)
		qs.append(q)
	for a in answers:
		var index_array: = r.find_answer(a)
		for i in index_array:
			qs[i].answers.append(a)
	return qs


func can_remove_at(i: int, all_a: Array[Answer]) -> bool:
	var q: = Question.new()
	q.robots = robots.duplicate()
	q.robots.remove_at(i)
	for a in all_a:
		if q.check_answer(a):
			q.answers.append(a)
			if q.answers.size() > 1:
				return true
	return false


func legality_check(all_a: Array[Answer]) -> bool:
	var size: = robots.size()
	if size < MIN_ROBOT_NUM:
		return false
	for i in size - 1:
		if not can_remove_at(i, all_a):
			return false
	return true


## 可以看作，从总数n个机器人中，依次询问是否加入游戏的全部子集求解过程
# 标准子集求解，n个元素共有2的n次个子集
# 此处每个机器人有r.num + 1种选择，且子集最多6个元素
# 另外，合法的子集要求答案唯一，且每个机器人都有贡献，且机器人数量大于2
# 因此构造递归如下，self为当前问题，all_r为全部机器人，cur为当前询问位置
# 其余信息记录在当前问题实例中
func complement_question(
	all_q: Array[Question],
	all_r: Array[Robot],
	all_a: Array[Answer],
	cur: int,
	) -> void:
	
	# 先检查停止条件
	# 问完，停止
	if cur == all_r.size():
		return
	# 机器人达到上限，停止
	if robots.size() == MAX_ROBOT_NUM:
		return
	# 邀请当前位置的机器人加入，生成全部可能问题
	var q_curs: = branches_append(all_r[cur])
	for q_cur in q_curs:
		# 检查新的问题是否结束递归
		match q_cur.answers.size():
			0:
				# 失败的尝试，不用往后问了
				continue
			1:
				# 疑似找到，不用往后问了
				if q_cur.legality_check(all_a):
					# 检查过再加入集合
					all_q.append(q_cur)
				continue
		
		# 继续递归，询问下一个机器人
		q_cur.complement_question(all_q, all_r, all_a, cur + 1)
	
	# 当前机器人不加入，询问下一位
	complement_question(all_q, all_r, all_a, cur + 1)
	return


# 调用递归
static func all_question_set(all_r: Array[Robot], all_a: Array[Answer]) -> Array[Question]:
	var all_q: Array[Question] = []
	var q: = Question.new()
	q.answers = all_a
	q.complement_question(all_q, all_r, all_a, 0)
	var q_file: = FileAccess.open(QUESTION_PATH, FileAccess.WRITE)
	#var n: = 0
	#prints('Question num:', all_q.size())
	for i in all_q:
		q_file.store_line(serialize(i))
		#prints('Question:', n)
		#for j in i.robots:
			#j.r_print()
		#print(i.answers.size(), i.answers[0].array)
		#n += 1
	q_file.close()
	return all_q



static func read_all_question_set(all_r: Array[Robot], all_a: Array[Answer]) -> Array[Question]:
	var all_q: Array[Question] = []
	var q_file: = FileAccess.open(QUESTION_PATH, FileAccess.READ)
	while q_file.get_position() < q_file.get_length():
		var q: = deserialize(q_file.get_line(), all_r, all_a)
		if not q:
			break
		all_q.append(q)
	q_file.close()
	return all_q


static func serialize(q: Question) -> String:
	var qa: = []
	for r in q.robots:
		qa.append(Robot.robot_to_array(r))
	return var_to_str(qa)




static func deserialize(s: String, all_r: Array[Robot], all_a: Array[Answer]) -> Question:
	var a = str_to_var(s)
	if a is Array:
		var qa: Array[Array] = []
		for i in a:
			if i is Array:
				qa.append(i)
			else:
				push_error('Invalid string')
				return
		
		if qa.size() >= MIN_ROBOT_NUM and qa.size() <= MAX_ROBOT_NUM:
			var q: = Question.new()
			q.answers = all_a
			for ra in qa:
				var r: = Robot.array_to_robot(ra, all_r)
				if not r:
					return
				q = q.dup_append(r)
			return q
	push_error('Invalid string')
	return
