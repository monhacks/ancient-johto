HiddenItems:
	ld a, [wCurRegion]
	and a ; Kanto?
	ld hl, HiddenItemCoords
	jr z, .gotHiddenItemCoordList
	; else Kansai
	ld hl, KansaiHiddenItemCoords
.gotHiddenItemCoordList
	call FindHiddenItemOrCoinsIndex
	ld [wHiddenItemOrCoinsIndex], a
	ld a, [wCurRegion]
	and a ; Kanto?
	ld hl, wObtainedHiddenItemsFlags
	jr z, .gotFlagList
	; else Kansai
	ld hl, wObtainedKansaiHiddenItemsFlags
.gotFlagList
	ld a, [wHiddenItemOrCoinsIndex]
	ld c, a
	ld b, FLAG_TEST
	predef FlagActionPredef
	ld a, c
	and a
	jr nz, .nope ; originally ret nz
	call EnableAutoTextBoxDrawing
	ld a, 1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, [wHiddenObjectFunctionArgument] ; item ID
	ld [wd11e], a
	call GetItemName
	tx_pre_jump FoundHiddenItemText

; added for field move hack
.nope
	predef TryFieldMove
	ret

INCLUDE "data/events/hidden_item_coords.asm"

FoundHiddenItemText::
	text_far _FoundHiddenItemText
	text_asm
	ld a, [wHiddenObjectFunctionArgument] ; item ID
	ld b, a
	ld c, 1
	call GiveItem
	jr nc, .bagFull
	ld a, [wCurRegion]
	and a ; Kanto?
	ld hl, wObtainedHiddenItemsFlags
	jr z, .gotFlagList
	; else Kansai
	ld hl, wObtainedKansaiHiddenItemsFlags
.gotFlagList
	ld a, [wHiddenItemOrCoinsIndex]
	ld c, a
	ld b, FLAG_SET
	predef FlagActionPredef
	ld a, SFX_GET_ITEM_2
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	jp TextScriptEnd
.bagFull
	call WaitForTextScrollButtonPress ; wait for button press
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, HiddenItemBagFullText
	call PrintText
	jp TextScriptEnd

HiddenItemBagFullText::
	text_far _HiddenItemBagFullText
	text_end

HiddenCoins:
	ld b, COIN_CASE
	predef GetQuantityOfItemInBag
	ld a, b
	and a
	ret z
	ld a, [wCurRegion]
	and a ; Kanto?
	ld hl, HiddenCoinCoords
	jr z, .gotHiddenCoinCoordList
	; else Kansai
	ld hl, KansaiHiddenCoinCoords
.gotHiddenCoinCoordList
	call FindHiddenItemOrCoinsIndex
	ld [wHiddenItemOrCoinsIndex], a
	ld a, [wCurRegion]
	and a ; Kanto?
	ld hl, wObtainedHiddenCoinsFlags
	jr z, .gotFlagList1
	; else Kansai
	ld hl, wObtainedKansaiHiddenCoinsFlags
.gotFlagList1
	ld a, [wHiddenItemOrCoinsIndex]
	ld c, a
	ld b, FLAG_TEST
	predef FlagActionPredef
	ld a, c
	and a
	ret nz
	xor a
	ldh [hUnusedCoinsByte], a
	ldh [hCoins], a
	ldh [hCoins + 1], a
	ld a, [wHiddenObjectFunctionArgument]
	cp 10
	jr z, .bcd10
	cp 20
	jr z, .bcd20
	cp 40
	jr z, .bcd40
	; else 100 coins
	jr .bcd100
.bcd10
	ld a, $10
	ldh [hCoins + 1], a
	jr .bcdDone
.bcd20
	ld a, $20
	ldh [hCoins + 1], a
	jr .bcdDone
.bcd40
	ld a, $40
	ldh [hCoins + 1], a
	jr .bcdDone
.bcd100
	ld a, $1
	ldh [hCoins], a
.bcdDone
	ld de, wPlayerCoins + 1
	ld hl, hCoins + 1
	ld c, $2
	predef AddBCDPredef
	ld a, [wCurRegion]
	and a ; Kanto?
	ld hl, wObtainedHiddenCoinsFlags
	jr z, .gotFlagList2
	; else Kansai
	ld hl, wObtainedKansaiHiddenCoinsFlags
.gotFlagList2
	ld a, [wHiddenItemOrCoinsIndex]
	ld c, a
	ld b, FLAG_SET
	predef FlagActionPredef
	call EnableAutoTextBoxDrawing
	ld a, [wPlayerCoins]
	cp $99
	jr nz, .roomInCoinCase
	ld a, [wPlayerCoins + 1]
	cp $99
	jr nz, .roomInCoinCase
	tx_pre_id DroppedHiddenCoinsText
	jr .done
.roomInCoinCase
	tx_pre_id FoundHiddenCoinsText
.done
	jp PrintPredefTextID

INCLUDE "data/events/hidden_coins.asm"

FoundHiddenCoinsText::
	text_far _FoundHiddenCoinsText
	sound_get_item_2
	text_end

DroppedHiddenCoinsText::
	text_far _FoundHiddenCoins2Text
	sound_get_item_2
	text_far _DroppedHiddenCoinsText
	text_end

FindHiddenItemOrCoinsIndex:
	ld a, [wHiddenObjectY]
	ld d, a
	ld a, [wHiddenObjectX]
	ld e, a
	ld a, [wCurMap]
	ld b, a
	ld c, -1
.loop
	inc c
	ld a, [hli]
	cp -1 ; end of the list?
	ret z  ; if so, we're done here
	cp b
	jr nz, .next1
	ld a, [hli]
	cp d
	jr nz, .next2
	ld a, [hli]
	cp e
	jr nz, .loop
	ld a, c
	ret
.next1
	inc hl
.next2
	inc hl
	jr .loop
