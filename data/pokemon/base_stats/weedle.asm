	db WEEDLE ; pokedex id

	db  40,  35,  30,  50,  20
	;   hp  atk  def  spd  spc

	db BUG, POISON ; type
	db 255 ; catch rate
	db 52 ; base exp

	INCBIN "gfx/pokemon/gmon/weedle.pic", 0, 1 ; sprite dimensions
	dw WeedlePicFront, WeedlePicBack

	ds 4 ; old level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm
	; end

	db BANK(WeedlePicFront)
