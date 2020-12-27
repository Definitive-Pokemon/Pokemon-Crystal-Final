; Landmarks indexes (see data/maps/landmarks.asm)
	const_def

; Johto landmarks
	const LANDMARK_SPECIAL           ; 00
	const LANDMARK_NEW_BARK_TOWN     ; 01
	const LANDMARK_ROUTE_29          ; 02
	const LANDMARK_CHERRYGROVE_CITY  ; 03
	const LANDMARK_ROUTE_30          ; 04
	const LANDMARK_ROUTE_31          ; 05
	const LANDMARK_VIOLET_CITY       ; 06
	const LANDMARK_SPROUT_TOWER      ; 07
	const LANDMARK_ROUTE_32          ; 08
	const LANDMARK_RUINS_OF_ALPH     ; 09
	const LANDMARK_UNION_CAVE        ; 0a
	const LANDMARK_ROUTE_33          ; 0b
	const LANDMARK_AZALEA_TOWN       ; 0c
	const LANDMARK_SLOWPOKE_WELL     ; 0d
	const LANDMARK_ILEX_FOREST       ; 0e
	const LANDMARK_ROUTE_34          ; 0f
	const LANDMARK_GOLDENROD_CITY    ; 10
	const LANDMARK_RADIO_TOWER       ; 11
	const LANDMARK_ROUTE_35          ; 12
	const LANDMARK_NATIONAL_PARK     ; 13
	const LANDMARK_ROUTE_36          ; 14
	const LANDMARK_ROUTE_37          ; 15
	const LANDMARK_ECRUTEAK_CITY     ; 16
	const LANDMARK_TIN_TOWER         ; 17
	const LANDMARK_BURNED_TOWER      ; 18
	const LANDMARK_ROUTE_38          ; 19
	const LANDMARK_ROUTE_39          ; 1a
	const LANDMARK_OLIVINE_CITY      ; 1b
	const LANDMARK_LIGHTHOUSE        ; 1c
	const LANDMARK_BATTLE_TOWER      ; 1d
	const LANDMARK_ROUTE_40          ; 1e
	const LANDMARK_RED_ROCK_ISLE          ; 1f
	const LANDMARK_SCARLET_CITY          ; 20
	const LANDMARK_RED_ROCK_OUTLOOK         ; 21
	const LANDMARK_SEARING_CRATER         ; 22
	const LANDMARK_ROUTE_41          ; 23
	const LANDMARK_WHIRL_ISLANDS     ; 24
	const LANDMARK_CIANWOOD_CITY     ; 25
	const LANDMARK_ROUTE_42          ; 26
	const LANDMARK_MT_MORTAR         ; 27
	const LANDMARK_MAHOGANY_TOWN     ; 28
	const LANDMARK_ROUTE_43          ; 29
	const LANDMARK_LAKE_OF_RAGE      ; 2a
	const LANDMARK_ROUTE_44          ; 2b
	const LANDMARK_ICE_PATH          ; 2c
	const LANDMARK_BLACKTHORN_CITY   ; 2d
	const LANDMARK_DRAGONS_DEN       ; 2e
	const LANDMARK_ROUTE_45          ; 2f
	const LANDMARK_DARK_CAVE         ; 30
	const LANDMARK_ROUTE_46          ; 31
	const LANDMARK_SILVER_CAVE       ; 32

KANTO_LANDMARK EQU const_value
	const LANDMARK_PALLET_TOWN       ; 33
	const LANDMARK_ROUTE_1           ; 34
	const LANDMARK_VIRIDIAN_CITY     ; 35
	const LANDMARK_ROUTE_2           ; 36
	const LANDMARK_PEWTER_CITY       ; 37
	const LANDMARK_ROUTE_3           ; 38
	const LANDMARK_MT_MOON           ; 39
	const LANDMARK_ROUTE_4           ; 3a
	const LANDMARK_CERULEAN_CITY     ; 3b
	const LANDMARK_ROUTE_24          ; 3c
	const LANDMARK_ROUTE_25          ; 3d
	const LANDMARK_ROUTE_5           ; 3e
	const LANDMARK_UNDERGROUND_PATH  ; 3f
	const LANDMARK_ROUTE_6           ; 40
	const LANDMARK_VERMILION_CITY    ; 41
	const LANDMARK_DIGLETTS_CAVE     ; 42
	const LANDMARK_ROUTE_7           ; 43
	const LANDMARK_ROUTE_8           ; 44
	const LANDMARK_ROUTE_9           ; 45
	const LANDMARK_ROCK_TUNNEL       ; 46
	const LANDMARK_ROUTE_10          ; 47
	const LANDMARK_POWER_PLANT       ; 48
	const LANDMARK_LAVENDER_TOWN     ; 49
	const LANDMARK_LAV_RADIO_TOWER   ; 4a
	const LANDMARK_CELADON_CITY      ; 4b
	const LANDMARK_SAFFRON_CITY      ; 4c
	const LANDMARK_ROUTE_11          ; 4d
	const LANDMARK_ROUTE_12          ; 4e
	const LANDMARK_ROUTE_13          ; 4f
	const LANDMARK_ROUTE_14          ; 50
	const LANDMARK_ROUTE_15          ; 51
	const LANDMARK_ROUTE_16          ; 52
	const LANDMARK_ROUTE_17          ; 53
	const LANDMARK_ROUTE_18          ; 54
	const LANDMARK_FUCHSIA_CITY      ; 55
	const LANDMARK_ROUTE_19          ; 56
	const LANDMARK_ROUTE_20          ; 57
	const LANDMARK_SEAFOAM_ISLANDS   ; 58
	const LANDMARK_CINNABAR_ISLAND   ; 59
	const LANDMARK_ROUTE_21          ; 5a
	const LANDMARK_ROUTE_22          ; 5b
	const LANDMARK_VICTORY_ROAD      ; 5c
	const LANDMARK_ROUTE_23          ; 5d
	const LANDMARK_INDIGO_PLATEAU    ; 5e
	const LANDMARK_ROUTE_26          ; 5f
	const LANDMARK_ROUTE_27          ; 60
	const LANDMARK_TOHJO_FALLS       ; 61
	const LANDMARK_ROUTE_28          ; 62
	const LANDMARK_FAST_SHIP         ; 63

; used in CaughtData
LANDMARK_GIFT  EQU $7e
LANDMARK_EVENT EQU $7f

; Regions
	const_def
	const JOHTO_REGION ; 0
	const KANTO_REGION ; 1
NUM_REGIONS EQU const_value
