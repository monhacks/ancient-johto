BluesHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 2
	warp_event  3,  7, LAST_MAP, 2

	def_bg_events

	def_object_events

	def_warps_to BLUES_HOUSE

BluesHouse_Script:
	jp EnableAutoTextBoxDrawing

BluesHouse_TextPointers:
	dw -1
