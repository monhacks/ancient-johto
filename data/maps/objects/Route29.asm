Route29_Object:
	db $f ; border block

	def_warps

	def_signs

	def_objects
	object SPRITE_POKE_BALL, 49,  2, STAY, NONE, 1, POTION

	def_warps_to ROUTE_29


Route29_Script:
	jp EnableAutoTextBoxDrawing

Route29_TextPointers:
	dw PickUpItemText
