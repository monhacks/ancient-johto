SetDefaultNames:
	ld a, [wLetterPrintingDelayFlags]
	push af
	ld a, [wOptions]
	push af
IF DEF(_DEBUG)
	ld a, [wd732]
	push af
ENDC
	ld hl, wPlayerName
	ld bc, wBoxDataEnd - wPlayerName
	xor a
	call FillMemory
	ld hl, wSpriteDataStart
	ld bc, wSpriteDataEnd - wSpriteDataStart
	xor a
	call FillMemory
IF DEF(_DEBUG)
	pop af
	ld [wd732], a
ENDC
	pop af
	ld [wOptions], a
	pop af
	ld [wLetterPrintingDelayFlags], a
	ld a, [wOptionsInitialized]
	and a
	call z, InitOptions
	ld hl, NintenText
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyData
	ld hl, SonyText
	ld de, wRivalName
	ld bc, NAME_LENGTH
	jp CopyData

OakSpeech:
	ld a, SFX_STOP_ALL_MUSIC
	call PlaySound
	call ClearScreen
	call LoadTextBoxTilePatterns
	call SetDefaultNames
	predef InitPlayerData2
	ld hl, wNumBoxItems
IF DEF(_DEBUG)
	ld a, SURFBOARD
ELSE
	ld a, POTION
ENDC
	ld [wcf91], a
	ld a, 1
	ld [wItemQuantity], a
	call AddItemToInventory  ; give one potion

	ld a, PAL_BLUEMON
	call GotPaletteID
	farcall ShowMarillTextScreens

	; choose Hiro or Kris
.pickPlayer
	call GBFadeOutToWhite
	call ClearScreen
	ld a, PAL_MEWMON
	call GotPaletteID
	ld de, ChrisPicFront
	lb bc, BANK(ChrisPicFront), $00
	call IntroDisplayPicLeft
	ld de, KrisPicFront
	lb bc, BANK(KrisPicFront), $00
	call IntroDisplayPicRight
	call FadeInIntroPic
	ld hl, WhichCharacterText
	call PrintText
	call CharacterChoice
	ld a, SFX_PRESS_AB
	call PlaySound
	call GBFadeOutToWhite
	call ClearScreen
	ld a, PAL_MEWMON
	call GotPaletteID
	; show the chosen player
	ld de, ChrisPicFront
	lb bc, BANK(ChrisPicFront), $00
	ld a, [wPlayerGender]
	and a
	jr z, .gotPic0
	ld de, KrisPicFront
	lb bc, BANK(KrisPicFront), $00
.gotPic0
	call IntroDisplayPicCenteredOrUpperRight
	call FadeInIntroPic
	ld hl, IsThisYouText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .pickPlayer
	ld hl, IntroducePlayerText
	call PrintText
	call ChoosePlayerName
	call GBFadeOutToWhite
	call ClearScreen

	; set starting region
IF DEF(_DEBUG)
	call GBFadeInFromWhite
	ld hl, DebugChooseRegionText
	call PrintText
	call DebugRegionChoice
	call GBFadeOutToWhite
	call ClearScreen
	ld a, [wCurrentMenuItem]
ELSE
	ld a, KANSAI_REGION
ENDC
	ld [wCurRegion], a
	ld [wDestinationRegion], a
	ld [wLastBlackoutRegion], a
	ld a, [wDefaultMap]
	ld [wDestinationMap], a
	call SpecialWarpIn
	xor a
	ldh [hTileAnimations], a
	ld a, MUSIC_ROUTE_30
	call PlayMusic
	ld a, PAL_MEWMON
	call GotPaletteID
	ld de, ProfElmPic
	lb bc, BANK(ProfElmPic), $00
	call IntroDisplayPicCenteredOrUpperRight
	call FadeInIntroPic
	ld hl, ElmSpeechText1
	call PrintText
	call GBFadeOutToWhite
	call ClearScreen
	call GetKotoraPalID
	ld a, KOTORA
	ld [wd0b5], a
	ld [wcf91], a
	call GetMonHeader
	hlcoord 6, 4
	call LoadFrontSpriteByMonIndex
	call MovePicLeft
	ld hl, ElmSpeechText2
	call PrintText
	call GBFadeOutToWhite
	call ClearScreen
	ld a, PAL_MEWMON
	call GotPaletteID
	ld de, ProfElmPic
	lb bc, BANK(ProfElmPic), $00
	call IntroDisplayPicCenteredOrUpperRight
	call FadeInIntroPic
	ld hl, ElmSpeechText3
	call PrintText
	call GBFadeOutToWhite
	call ClearScreen
	call GetRivalPalID
	ld de, Rival1Pic
	lb bc, BANK(Rival1Pic), $00
	call IntroDisplayPicCenteredOrUpperRight
	call FadeInIntroPic
	ld hl, IntroduceRivalText
	call PrintText
	call ChooseRivalName
.skipChoosingNames
	call GBFadeOutToWhite
	call GetRedPalID
	ld de, ChrisPicFront
	lb bc, BANK(ChrisPicFront), $00
	ld a, [wPlayerGender]
	and a
	jr z, .notKris2
	ld de, KrisPicFront
	lb bc, BANK(KrisPicFront), $00
.notKris2
	call IntroDisplayPicCenteredOrUpperRight
	call GBFadeInFromWhite
	ld a, [wd72d]
	and a
	jr nz, .next
	ld hl, ElmSpeechText4
	call PrintText
.next
	ldh a, [hLoadedROMBank]
	push af
	ld a, SFX_SHRINK
	call PlaySound
	pop af
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ld c, 4
	call DelayFrames
	ld de, SpriteChris
	lb bc, BANK(SpriteChris), $0C
	ld a, [wPlayerGender]
	and a
	jr z, .notKris3
	ld de, SpriteKris
	lb bc, BANK(SpriteKris), $0C
.notKris3
	ld hl, vSprites
	call CopyVideoData
	ld de, ShrinkPic1
	lb bc, BANK(ShrinkPic1), $00
	call IntroDisplayPicCenteredOrUpperRight
	ld c, 4
	call DelayFrames
	ld de, ShrinkPic2
	lb bc, BANK(ShrinkPic2), $00
	call IntroDisplayPicCenteredOrUpperRight
	call ResetPlayerSpriteData
	ldh a, [hLoadedROMBank]
	push af
;	ld a, 0 ; BANK(Music_PalletTown)
;	ld [wAudioROMBank], a
;	ld [wAudioSavedROMBank], a

	ld a, 10
	ld [wMusicFade], a
	xor a
	ld [wMusicFadeID], a

	pop af
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ld c, 20
	call DelayFrames
	hlcoord 6, 5
	ld b, 7
	ld c, 7
	call ClearScreenArea
	call LoadTextBoxTilePatterns
	ld a, 1
	ld [wUpdateSpritesEnabled], a
	ld c, 50
	call DelayFrames
	call GBFadeOutToWhite
	jp ClearScreen

IntroducePlayerText:
	text_far _IntroducePlayerText
	text_end

ElmSpeechText1:
	text_far _ElmSpeechText1
	text_end

ElmSpeechText2:
	text_far _ElmSpeechText2A
	sound_cry_kotora
	text_far _ElmSpeechText2B
	text_end

IntroduceRivalText:
	text_far _IntroduceRivalText
	text_end

ElmSpeechText3:
	text_far _ElmSpeechText3
	text_end

ElmSpeechText4:
	text_far _ElmSpeechText4
	text_end

FadeInIntroPic:
	ld hl, IntroFadePalettes
	ld b, 6
.next
	ld a, [hli]
	ldh [rBGP], a
	ld c, 10
	call DelayFrames
	dec b
	jr nz, .next
	ret

IntroFadePalettes:
	db %01010100
	db %10101000
	db %11111100
	db %11111000
	db %11110100
	db %11100100

MovePicLeft:
	ld a, 119
	ldh [rWX], a
	call DelayFrame

	ld a, %11100100
	ldh [rBGP], a
.next
	call DelayFrame
	ldh a, [rWX]
	sub 8
	cp $FF
	ret z
	ldh [rWX], a
	jr .next

DisplayPicCenteredOrUpperRight:
	call GetPredefRegisters
IntroDisplayPicCenteredOrUpperRight:
; b = bank
; de = address of compressed pic
; c: 0 = centred, non-zero = upper-right
	push bc
	ld a, b
	call UncompressSpriteFromDE
	ld hl, sSpriteBuffer1
	ld de, sSpriteBuffer0
	ld bc, $310
	call CopyData
	ld de, vFrontPic
	call InterlaceMergeSpriteBuffers
	pop bc
	ld a, c
	and a
	hlcoord 14, 2
	jr nz, .next
	hlcoord 6, 4
.next
	xor a
	ldh [hStartTileID], a
	predef_jump CopyUncompressedPicToTilemap

IF DEF(_DEBUG)
DebugRegionChoice::
	call SaveScreenTilesToBuffer1
	ld a, KANTO_JOHTO_MENU
	ld [wTwoOptionMenuID], a
	coord hl, 12, 7
	lb bc, 8, 13
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID
	jp LoadScreenTilesFromBuffer1

DebugChooseRegionText:
	text "DEBUG: Which"
	line "region?"
	done
ENDC

GetKotoraPalID:
	ld a, PAL_YELLOWMON
	jr GotPaletteID
GetRedPalID:
	call ClearScreen
	ld a, PAL_MEWMON
	jr GotPaletteID
GetRivalPalID:
	call ClearScreen
	ld a, PAL_MEWMON
GotPaletteID:
	push af
	ld hl, SendIntroPal
	ld b, BANK(SendIntroPal)
	jp Bankswitch

IntroDisplayPicLeft:
; b = bank
; de = address of compressed pic
	ld a, b
	call UncompressSpriteFromDE
	ld hl, sSpriteBuffer1
	ld de, sSpriteBuffer0
	ld bc, $310
	call CopyData
	ld de, vFrontPic
	call InterlaceMergeSpriteBuffers
	hlcoord 2, 4
	xor a
	ldh [hStartTileID], a
	predef_jump CopyUncompressedPicToTilemap

IntroDisplayPicRight:
; b = bank
; de = address of compressed pic
	ld a, b
	call UncompressSpriteFromDE
	ld hl, sSpriteBuffer1
	ld de, sSpriteBuffer0
	ld bc, $310
	call CopyData
	ld de, vBackPic
	call InterlaceMergeSpriteBuffers
	hlcoord 11, 4
	ld a, $31
	ldh [hStartTileID], a
	predef_jump CopyUncompressedPicToTilemap

WhichCharacterText:
	text "Which photo is on"
	line "your TRAINER CARD?"
	done

IsThisYouText:
	text "Is this you?"
	done

CharacterChoice:
	; erase previous cursors
	ld a, " "
	hlcoord 5, 3
	ld [hl], a
	hlcoord 14, 3
	ld [hl], a

	ld a, [wPlayerGender]
	and a
	jr z, .p1
	; p2
	ld a, "▼"
	hlcoord 14, 3
	ld [hl], a
	jr .loop
.p1
	ld a, "▼"
	hlcoord 5, 3
	ld [hl], a
.loop
	call DelayFrame
	call ReadJoypad
	ldh a, [hJoyInput]
	bit BIT_A_BUTTON, a
	ret nz
	bit BIT_D_RIGHT, a
	jr nz, .d_right
	bit BIT_D_LEFT, a
	jr z, .loop
	; left
	ld a, [wPlayerGender]
	and a
	; already on Hiro?
	jr z, .got_player
	; if not, switch to Hiro
	dec a
	jr  .got_player
.d_right
	ld a, [wPlayerGender]
	cp 1
	; already Kris?
	jr z, .got_player
	inc a
.got_player
	ld [wPlayerGender], a
	jr CharacterChoice
