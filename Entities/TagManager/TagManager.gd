extends Node
class_name TagManager


onready var tagRules: Array = get_children()

var currentTags: Array = []

func updateFromStats(stats):
	for tagRule in tagRules:
		if tagRule.verify_add_condition(stats):
			currentTags.append(tagRule.tag)
		else:
			currentTags.erase(tagRule.tag)

func add_tag(tag):
	currentTags.append(tag)

func remove_tag(tag):
	currentTags.erase(tag)
