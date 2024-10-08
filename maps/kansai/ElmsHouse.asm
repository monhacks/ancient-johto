; text constants
	const_def 1
	; NPCs
	const_export ELMSHOUSE_ELMS_WIFE
	const_export ELMSHOUSE_ELMS_SON
	; Signs
	const ELMSHOUSE_TV

ElmsHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 3
	warp_event  3,  7, LAST_MAP, 3

	def_bg_events
	bg_event  4,  1, ELMSHOUSE_TV

	def_object_events
	object_event  2,  4, SPRITE_TEACHER, STAY, RIGHT, ELMSHOUSE_ELMS_WIFE
	object_event  5,  3, SPRITE_BUG_CATCHER, STAY, UP, ELMSHOUSE_ELMS_SON

	def_warps_to ELMS_HOUSE


ElmsHouse_Script:
	jp EnableAutoTextBoxDrawing

ElmsHouse_TextPointers:
	dw ElmsWifeText
	dw ElmsSonText
	dw ElmsTVText

ElmsWifeText:
	text_asm
	CheckEvent EVENT_GOT_STARTER
	ld hl, .Text2
	jr nz, .done
	ld hl, .Text1
.done
	call PrintText
	jp TextScriptEnd

.Text1
	text "Hi, <PLAYER>! Did"
	line "you come here"

	para "looking for my"
	line "husband?"

	para "He's out at his"
	line "lab right now."

	para "I wish he would"
	line "spend more time"
	cont "here at home…"
	done

.Text2
	text "My husband gets so"
	line "caught up in his"
	cont "work sometimes."

	para "I know he's only"
	line "next door, but I"
	cont "wish he was home"
	cont "more often…"
	done

ElmsSonText:
	text "I like it when Dad"
	line "lets me help take"

	para "care of #MON"
	line "at the lab."

	para "I'm gonna be just"
	line "like him when I"
	cont "grow up!"
	done

ElmsTVText:
	text_asm
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ld hl, .OopsWrongSideText
	jr nz, .got_text
	ld hl, .TVText
.got_text
	call PrintText
	jp TextScriptEnd

.TVText
	text "There's a show on"
	line "TV. A kid with"

	para "black hair and a"
	line "monkey tail is"

	para "riding a cloud."
	line "I'd better go too!"
	done

.OopsWrongSideText
	text "Oops, wrong side."
	done
