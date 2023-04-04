; text constants
	const_def 1
	; NPCs
	;const KANTO_ROUTE27_FISHER
	; Signs
	;const KANTO_ROUTE27_SIGN

Route26_Object:
	db $05 ; border block

	def_warps
	;warp  7,  5, 0, ROUTE_22_GATE

	def_signs
	;sign 25,  7, KANTO_ROUTE27_SIGN

	def_objects
	;object SPRITE_FISHER, 20, 10, STAY, LEFT, KANTO_ROUTE27_FISHER

	def_warps_to KANTO_ROUTE_27


Route26_Script:
	jp EnableAutoTextBoxDrawing

Route26_TextPointers:
	dw -1
