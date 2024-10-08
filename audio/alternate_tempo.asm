; an alternate start for MeetRival which has a different first measure
Music_RivalAlternateStart::
	ld c, 0 ; BANK(Music_MeetRival)
	ld a, MUSIC_MEET_GARY
	call PlayMusic
	ld hl, wChannel1MusicAddress
	ld de, Music_MeetRival_branch_b1a2
	call Audio1_OverwriteChannelPointer
	ld hl, wChannel2MusicAddress
	ld de, Music_MeetRival_branch_b21d
	call Audio1_OverwriteChannelPointer
	ld hl, wChannel3MusicAddress
	ld de, Music_MeetRival_branch_b2b5

Audio1_OverwriteChannelPointer:
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ret

; an alternate tempo for MeetRival which is slightly slower
Music_RivalAlternateTempo::
	ld c, 0 ; BANK(Music_MeetRival)
	ld a, MUSIC_MEET_GARY
	call PlayMusic
	ld hl, wChannel1MusicAddress
	ld de, Music_MeetRival_branch_b119
	jp Audio1_OverwriteChannelPointer

; applies both the alternate start and alternate tempo
Music_RivalAlternateStartAndTempo::
	call Music_RivalAlternateStart
	ld hl, wChannel1MusicAddress
	ld de, Music_MeetRival_branch_b19b
	jp Audio1_OverwriteChannelPointer

; an alternate tempo for Cities1 which is used for the Hall of Fame room
Music_Cities1AlternateTempo::
	ld a, 10
	ld [wMusicFade], a
	xor a
	ld [wMusicFadeID], a
	ld c, 100
	call DelayFrames ; wait for the fade-out to finish
	ld c, 0 ; BANK(Music_Cities1)
	ld a, MUSIC_CITIES1
	call PlayMusic
	ld hl, wChannel1MusicAddress
	ld de, Music_ViridianCity_Ch1_AltStart ; Music_Cities1_branch_aa6f
	jp Audio1_OverwriteChannelPointer
