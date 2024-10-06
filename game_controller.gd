extends Node2D

var robot1

var all_a
var all_r
var all_q


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#var rs = Robot.all_robot_set()
	#print(rs)
	all_a = Answer.all_answer_set()
	#for i in allas:
		#print(i.array)
	#robot1 = rs[0]
	#rs[0].num = 1
	#print(rs[0].num)
	#var all_q: = Question.all_question_set()
	all_r = Robot.all_robot_set(all_a)
	#all_q = Question.all_question_set(all_r, all_a)
	#all_q = Question.read_all_question_set(all_r, all_a)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
