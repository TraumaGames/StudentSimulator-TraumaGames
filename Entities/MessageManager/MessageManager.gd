extends Node
class_name MessageManager

var results:Array=[]
var exam_results:Array=[]
onready var cards: Array = get_children()
var easy_exam:Array = []
var hard_exam:Array = []
var calification= 0
var type_exam:String
var card_result

var index:int = 0
func _ready():
	for card in cards : 
		if card.type()=="easy":
			easy_exam.append(card)
			exam_results.append(card.correct)
		else: 
			hard_exam.append(card)
			exam_results.append(card.correct)
		card.set_parent(self)

func game_over_message(state):
	if state["stats"][StatManager.Stats.EXERCISES] == 100:
		return "easy"
	else:
		return "hard"

func wait_message():
	return "..."

func next_card():
	self.index+=1

func save(result):
	next_card()
	results.append(result)

func generate_exam(card_exam,result):
	if index<10 : 
		generate_card(card_exam,result)
		card_exam.show()
	else :
		card_exam.hide()
		self.index= 0
		self.calification=0
		evaluate_exam()
		card_result.initialize("Tu calificacion es: "+str(calification), "Continuar")
		card_result.show()
		
func generate_card(card_exam,type):
	self.type_exam=type
	if type=="easy":
		
		easy_exam[index].init_exam(card_exam)
	else:
		hard_exam[index].init_exam(card_exam)

func evaluate_exam():
	for i in range(0,9):
		if(exam_results[i] == results[i]):
			calification+=1
				
		
func set_unary_card(card_res):
	self.card_result= card_res
