	db KAMEASEL ; pokedex id

	db  55,  75,  55, 115,  95
	;   hp  atk  def  spd  spc

	db DARK, ICE ; type
	db 60 ; catch rate
	db 132 ; base exp

	INCBIN "gfx/pokemon/front/kameasel.pic", 0, 1 ; sprite dimensions
	dw KameaselPicFront, KameaselPicBack

	ds 4 ; old level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm
	; end

	db BANK(KameaselPicFront)
