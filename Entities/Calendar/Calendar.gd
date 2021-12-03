extends TextureButton

func show_cross_up_to(dayNumber:int):
	var number = dayNumber
	var crosses = $Crosses.get_children().slice(0, number-1)
	for c in crosses:
		c.show()
		

func reset_calendar():
	var crosses = $Crosses.get_children()
	for c in crosses:
		c.hide()
