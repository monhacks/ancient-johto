	db BLOSSETTE ; pokedex id

	db  30,  30,  30,  30,  30
	;   hp  atk  def  spd  spc

	db GRASS, GRASS ; type
	db 235 ; catch rate
	db 52 ; base exp

	INCBIN "gfx/pokemon/front/blossette.pic", 0, 1 ; sprite dimensions
	dw BlossettePicFront, BlossettePicBack

	ds 4 ; old level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm
	; end

	db BANK(BlossettePicFront)
