; width of east/west connections
; height of north/south connections
MAP_BORDER EQU 3

; connection directions
	const_def
	shift_const EAST   ; 1
	shift_const WEST   ; 2
	shift_const SOUTH  ; 4
	shift_const NORTH  ; 8

; flower and water tile animations
	const_def
	const TILEANIM_NONE          ; 0
	const TILEANIM_LIST          ; 1
