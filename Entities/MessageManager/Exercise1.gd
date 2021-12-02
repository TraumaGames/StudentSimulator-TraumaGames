extends Node
export var question:String
export var buton1_Text:String
export var buton2_Text:String
export var buton3_Text:String
export var buton4_Text:String
export var correct:String
var parent 


func set_parent(parent):
	self.parent=parent

func init_exam(card_exam):
	card_exam.initialize(question,buton1_Text,buton2_Text,buton3_Text,buton4_Text)


func type():
	return "easy"	
