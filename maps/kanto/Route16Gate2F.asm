Route16Gate2F_Object:
	db $a ; border block

	def_warps
	warp  7,  7, 8, ROUTE_16_GATE_1F

	def_signs

	def_objects

	def_warps_to ROUTE_16_GATE_2F

Route16Gate2F_Script:
	jp EnableAutoTextBoxDrawing

Route16Gate2F_TextPointers:
	dw -1