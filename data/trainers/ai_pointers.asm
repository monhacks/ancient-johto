TrainerAIPointers:
	table_width 3, TrainerAIPointers
	; one entry per trainer class
	; first byte, number of times (per Pokémon) it can occur
	; next two bytes, pointer to AI subroutine for trainer class
	; subroutines are defined in engine/battle/trainer_ai.asm
	dbw 3, GenericAI      ;  PROF_ELM
	dbw 3, GenericAI      ;  PROF_OAK
	dbw 3, GenericAI      ;  RIVAL1
	dbw 3, GenericAI      ;  RIVAL2
	dbw 3, GenericAI      ;  FALKNER
	dbw 3, GenericAI      ;  BUGSY
	dbw 3, GenericAI      ;  WHITNEY
	dbw 3, GenericAI      ;  MORTY
	dbw 3, GenericAI      ;  PRYCE
	dbw 3, GenericAI      ;  JASMINE
	dbw 3, GenericAI      ;  CHUCK
	dbw 3, GenericAI      ;  CLAIR
	dbw 3, GenericAI      ;  WILL
	dbw 3, GenericAI      ;  MIKAN
	dbw 3, GenericAI      ;  WALKER
	dbw 3, GenericAI      ;  KAREN
	dbw 3, GenericAI      ;  CHAMPION
	dbw 3, KogaAI         ;  KOGA
	dbw 3, LoreleiAI      ;  LORELEI
	dbw 3, BrunoAI        ;  BRUNO
	dbw 3, LanceAI        ;  LANCE
	dbw 3, GenericAI      ;  RED
	dbw 3, GenericAI      ;  BLUE
	dbw 3, AgathaAI       ;  AGATHA
	dbw 3, BrockAI        ;  BROCK
	dbw 3, MistyAI        ;  MISTY
	dbw 3, LtSurgeAI      ;  LT_SURGE
	dbw 3, ErikaAI        ;  ERIKA
	dbw 3, KogaAI         ;  JANINE
	dbw 3, SabrinaAI      ;  SABRINA
	dbw 3, BlaineAI       ;  BLAINE
	dbw 3, GiovanniAI     ;  GIOVANNI
	dbw 3, GenericAI      ;  EXECUTIVEM
	dbw 3, GenericAI      ;  EXECUTIVEF
	dbw 3, GenericAI      ;  GRUNTM
	dbw 3, GenericAI      ;  GRUNTF
	dbw 3, GenericAI      ;  JESSIE_JAMES
	dbw 3, GenericAI      ;  BUTCH_CASSIDY
	dbw 3, GenericAI      ;  IMPOSTER
	dbw 3, GenericAI      ;  SCIENTIST
	dbw 3, GenericAI      ;  BURGLAR
	dbw 3, GenericAI      ;  YOUNGSTER
	dbw 3, GenericAI      ;  BUG_CATCHER
	dbw 3, GenericAI      ;  SCHOOLBOY
	dbw 3, GenericAI      ;  BIRD_KEEPER
	dbw 3, GenericAI      ;  TWINS
	dbw 3, GenericAI      ;  LASS
	dbw 3, GenericAI      ;  BEAUTY
	dbw 3, GenericAI      ;  PICNICKER
	dbw 3, GenericAI      ;  CAMPER
	dbw 3, CooltrainerMAI ;  COOLTRAINERM
	dbw 3, CooltrainerFAI ;  COOLTRAINERF
	dbw 3, GenericAI      ;  POKEMANIAC
	dbw 3, GenericAI      ;  SUPER_NERD
	dbw 3, GenericAI      ;  GENTLEMAN
	dbw 3, GenericAI      ;  SKIER
	dbw 3, GenericAI      ;  BOARDER
	dbw 3, GenericAI      ;  TEACHERF
	dbw 3, GenericAI      ;  TEACHERM
	dbw 3, GenericAI      ;  FISHER
	dbw 3, GenericAI      ;  SWIMMERM
	dbw 3, GenericAI      ;  SWIMMERF
	dbw 3, GenericAI      ;  ATHLETE
	dbw 3, GenericAI      ;  SAILOR
	dbw 3, GenericAI      ;  ROCKER
	dbw 3, GenericAI      ;  GUITARIST
	dbw 3, GenericAI      ;  HIKER
	dbw 3, GenericAI      ;  BIKER
	dbw 3, GenericAI      ;  CUE_BALL
	dbw 3, GenericAI      ;  GAMBLER
	dbw 3, GenericAI      ;  TAMER
	dbw 3, GenericAI      ;  FIREBREATHER
	dbw 3, JugglerAI      ;  JUGGLER
	dbw 3, BlackbeltAI    ;  BLACKBELT
	dbw 3, GenericAI      ;  PSYCHIC_TR
	dbw 3, GenericAI      ;  HANDYMAN
	dbw 3, GenericAI      ;  SOLDIER
	dbw 3, GenericAI      ;  SAGE
	dbw 3, GenericAI      ;  MEDIUM
	dbw 3, GenericAI      ;  CHANNELER
	dbw 3, GenericAI      ;  KIMONO_GIRL
	dbw 3, GenericAI      ;  POKEFANF
	dbw 3, GenericAI      ;  POKEFANM
	dbw 3, GenericAI      ;  OFFICER
	dbw 3, GenericAI      ;  REI
	dbw 3, GenericAI      ;  KURT
	assert_table_length NUM_TRAINERS
