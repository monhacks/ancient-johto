; Roofs indexes
	const_def
	const ROOF_NEW_BARK  ; 0
	const ROOF_VIOLET    ; 1
	const ROOF_AZALEA    ; 2
	const ROOF_OLIVINE   ; 3
	const ROOF_GOLDENROD ; 4

MapRoofSets:
	table_width 1, MapRoofSets
	db ROOF_NEW_BARK  ; SILENT_HILLS
	db ROOF_NEW_BARK  ; SAKURA_TOWN
	db ROOF_NEW_BARK  ; BELLFLOWER_CITY
	db ROOF_NEW_BARK  ; KANSAI_ROUTE_1
	db ROOF_NEW_BARK  ; KANSAI_ROUTE_2
	db ROOF_NEW_BARK  ; KANSAI_ROUTE_3
	assert_table_length FIRST_KANSAI_INDOOR_MAP

; Format:
; 00: determines whether the map is split East/West or North/South
; 01: coordinate of dividing line
; 02: roof set ID if in the West or North side
; 03: roof set ID if in the East or South side
SplitMapRoofSets:
	db NORTH_SOUTH, 37, ROOF_AZALEA,    ROOF_NEW_BARK  ; $f1 **placeholder


TilesetsWithRoofs:
	db SILENT
	db -1


Roofs:
	INCBIN "gfx/tilesets/roofs/new_bark.2bpp"
	INCBIN "gfx/tilesets/roofs/violet.2bpp"
	INCBIN "gfx/tilesets/roofs/azalea.2bpp"
	INCBIN "gfx/tilesets/roofs/olivine.2bpp"
	INCBIN "gfx/tilesets/roofs/goldenrod.2bpp"
