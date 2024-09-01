extends Node

var num = 4
var robots: Array[Robot] = []
var questions = []
var all = []
var id = 0

var selected_robot = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	robots = Robot.all_robot_set()
	
	var answer = Answer.all_answer_set()
	
	#for i in robots:
		#i.print_r()
	
	
	find_question([], answer, 0, 0)
	
	print('Questions count: ', questions.size())
	print_questions()
	
	
	id = randi() % questions.size()
	
	for i in questions[id]:
		$TextEdit.text += robots[i[0]].des[-1] + '\n'
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



# 可以看作，从总数num个机器人中，依次询问是否加入游戏的全部子集求解过程
# 标准子集求解，num个元素共有2的num次个子集
# 此处每个元素有sets.size()+1种选择，而非是否两种选择
# 且，子集最多6个元素
# 另外，合法的子集要求答案唯一，且每个机器人都有贡献
# 因此构造递归如下，q为当前子集，a为当前答案集，i为当前位置，n为当前元素个数
func find_question(q: Array, a: Array, i, n):
	# 讯问当前位置的机器人
	for j in robots[i].num:
		# 加入时创建新子集
		var q_cur = q + [[i, j]]
		# 计算新答案集，此计算也新建数组
		var a_cur = intersection(a, robots[i].sets[j])
		print(q_cur,':', a_cur.size())
		# 检查是否结束递归
		match a_cur.size():
			0:
				# 失败的尝试，不用往后问了
				continue
			1:
				# 成功找到，不用往后问了
				if ques_check(q_cur):
					print('no')
				else:
					questions.append(q_cur)
				
					print(a_cur)
				continue
		#元素满了或问完了，也结束
		if n == 5:
			continue
		if i == num - 1:
			continue
		# 接着问下一个机器人，不要修改参数，会影响循环中的其他选择
		find_question(q_cur, a_cur, i + 1, n + 1)
		
	# 循环结束，还有最后一种选择，不加入，继续问下一个人
	if i == num -1:
		return
	find_question(q, a, i + 1, n)
	
	return



func intersection(a: Array, b: Array):
	var c = []
	for i in a:
		if b.has(i):
			c.append(i)
	return c


func ques_check(q: Array):
	for i in q.size():
		var q_cur = q.duplicate(true)
		q_cur.remove_at(i)
		return get_answer(q_cur).size() == 1

func print_questions():
	
	for i in questions:
		print('Question: ', questions.find(i))
		for j in i:
			robots[j[0]].print_robot(j[1])
		print('Answer: ', get_answer(i))


func get_answer(q: Array):
	var a = all.duplicate(true)
	for i in q:
		a = intersection(a, robots[i[0]].sets[i[1]])
	return a


func _on_button_button_down() -> void:
	selected_robot = 0
	pass # Replace with function body.


func _on_button_2_button_down() -> void:
	selected_robot = 1
	pass # Replace with function body.


func _on_button_3_button_down() -> void:
	selected_robot = 2
	pass # Replace with function body.


func _on_button_4_button_down() -> void:
	
	selected_robot = 3
	pass # Replace with function body.


func _on_button_5_button_down() -> void:
	
	selected_robot = 4
	pass # Replace with function body.


func _on_button_6_button_down() -> void:
	selected_robot = 5
	pass # Replace with function body.


func _on_button_7_pressed() -> void:
	var ai = int($TextEdit2.text)
	var a = [ai / 100, ai / 10 % 10, ai % 10]
	print(a)
	var rn = questions[id][selected_robot]
	if robots[rn[0]].conditions[rn[1]].call(a[0], a[1], a[2]):
		$TextEdit3.text = 'TRUE'
	else:
		$TextEdit3.text = 'FALSE'
	pass # Replace with function body.


func _on_button_8_button_down() -> void:
	$TextEdit.text = ''
	id = randi() % questions.size()
	
	for i in questions[id]:
		$TextEdit.text += robots[i[0]].des[-1] + '\n'
	pass # Replace with function body.
