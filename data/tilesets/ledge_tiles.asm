LedgeTiles:
	dbw OVERWORLD, .overworld
	dbw JOHTO, .johto

	; player direction, tile player standing on, ledge tile, input required
.overworld
	db SPRITE_FACING_DOWN,  $2C, $37, D_DOWN
	db SPRITE_FACING_DOWN,  $39, $36, D_DOWN
	db SPRITE_FACING_DOWN,  $39, $37, D_DOWN
	db SPRITE_FACING_LEFT,  $2C, $27, D_LEFT
	db SPRITE_FACING_LEFT,  $39, $27, D_LEFT
	db SPRITE_FACING_RIGHT, $2C, $0D, D_RIGHT
	db SPRITE_FACING_RIGHT, $2C, $1D, D_RIGHT
	db SPRITE_FACING_RIGHT, $39, $0D, D_RIGHT
	db -1 ; end

.johto
	db SPRITE_FACING_DOWN,  $05, $4C, D_DOWN
	db SPRITE_FACING_DOWN,  $06, $4C, D_DOWN
	db SPRITE_FACING_LEFT,  $05, $3B, D_LEFT
	db SPRITE_FACING_LEFT,  $06, $3B, D_LEFT
	db SPRITE_FACING_RIGHT, $05, $60, D_RIGHT
	db SPRITE_FACING_RIGHT, $06, $61, D_RIGHT
	db -1 ; end
