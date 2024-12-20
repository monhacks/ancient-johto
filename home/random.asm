Random::
; Return a random number in a.
; For battles, use BattleRandom.
	push hl
	push de
	push bc
	farcall Random_
	ldh a, [hRandomAdd]
	ld [wBattleRand], a ; sometimes BattleRandom is farcall'd, and uses Random when not link battling
	pop bc
	pop de
	pop hl
	ret
