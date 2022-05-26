WarpTileListPointers:
	dw .FacingDownWarpTiles
	dw .FacingUpWarpTiles
	dw .FacingLeftWarpTiles
	dw .FacingRightWarpTiles

warp_carpet_tiles: MACRO
REPT _NARG
	db \1
	shift
ENDR
	db -1 ; end
ENDM

.FacingDownWarpTiles:
	warp_carpet_tiles $01, $12, $17, $3D, $04, $18, $33, $0E, $48

.FacingUpWarpTiles:
	warp_carpet_tiles $01, $5C

.FacingLeftWarpTiles:
	warp_carpet_tiles $1A, $4B, $1B, $02 

.FacingRightWarpTiles:
	warp_carpet_tiles $0F, $4E, $01, $1A
