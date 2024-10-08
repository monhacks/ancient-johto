; prints text for bookshelves in buildings without sign events
PrintBookshelfText::
	call IsSpriteOrSignInFrontOfPlayer
	ld a, [hSpriteIndexOrTextID]
	and a
	jr nz, .noMatch
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	jr nz, .noMatch
; facing up
	ld a, [wCurMapTileset]
	ld b, a
	lda_coord 8, 7
	ld c, a
	ld hl, BookshelfTileIDs
.loop
	ld a, [hli]
	cp $ff
	jr z, .noMatch
	cp b
	jr nz, .nextBookshelfEntry1
	ld a, [hli]
	cp c
	jr nz, .nextBookshelfEntry2
	ld a, [hl]
	push af
	call SaveScreenTilesToBuffer2
	call EnableAutoTextBoxDrawing
	pop af
	call PrintPredefTextID
	xor a
	ldh [hFFDB], a
	ret
.nextBookshelfEntry1
	inc hl
.nextBookshelfEntry2
	inc hl
	jr .loop
.noMatch
	ld a, $ff
	ldh [hFFDB], a
	ret

INCLUDE "data/tilesets/bookshelf_tile_ids.asm"
