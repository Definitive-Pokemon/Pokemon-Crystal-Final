	object_const_def
	const SCARLETCITY_LASS
	const SCARLETCITY_BEAUTY1
	const SCARLETCITY_SAILOR
	const SCARLETCITY_SUPER_NERD
	const SCARLETCITY_POKEFAN_F1
	const SCARLETCITY_POKEFAN_F2
	const SCARLETCITY_POKEFAN_M1
	const SCARLETCITY_STANDING_YOUNGSTER
	const SCARLETCITY_POKEFAN_M2
	const SCARLETCITY_BEAUTY2
	

ScarletCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .Flypoint

.Flypoint:
	setflag ENGINE_FLYPOINT_SCARLET
	return

ScarletCityLassScript:
	jumptextfaceplayer ScarletCityLassText

ScarletCityBeauty1Script:
	jumptextfaceplayer ScarletCityBeauty1Text

ScarletCitySailorScript:
	jumptextfaceplayer ScarletCitySailorText

ScarletCitySuperNerdScript:
	jumptextfaceplayer ScarletCitySuperNerdText

ScarletCityPokefanF1Script:
	jumptextfaceplayer ScarletCityPokefanF1Text

ScarletCityPokefanF2Script:
	jumptextfaceplayer ScarletCityPokefanF2Text

ScarletCityPokefanM1Script:
	jumptextfaceplayer ScarletCityPokefanM1Text

ScarletCityStandingYoungsterScript:
	jumptextfaceplayer ScarletCityStandingYoungsterText

ScarletCityPokefanM2Script:
	jumptextfaceplayer ScarletCityPokefanM2Text

ScarletCityBeauty2Script:
	jumptextfaceplayer ScarletCityBeauty2Text

ScarletCitySign:
	jumptext ScarletCitySignText

ScarletGymSign:
	jumptext ScarletGymSignText

BattleTowerSign:
	jumptext BattleTowerSignText

LabSign:
	jumptext LabSignText

OutlookSign:
	jumptext OutlookSignText

ScarletCityLassText:
	text "We recently"
	line "moved here."

	para "This city is so"
	line "nice to live in!"

	para "Lots of flowers,"
	line "and trees and"

	para "the fresh air"
	line "of the sea."
	done

ScarletCityBeauty1Text:
	text "Are you gonna"
	line "take on the"
	cont "BATTLE TOWER?"

	para "Better be careful,"
	line "because I'm going"

	para "to smash everyone"
	line "who gets in my"
	cont "way!"
	done

ScarletCitySailorText:
	text "I sailed all the"
	line "way to RED ROCK"

	para "to challenge the"
	line "toughest TRAINERS"
	cont "in this tower!"

	para "You think you"
	line "stand a chance?"

	para "Bwahahahaha!"
	done

ScarletCitySuperNerdText:
	text "All those people"
	line "come together"
	cont "just to battle."

	para "Me? I just come"
	line "here to enjoy the"
	cont "view of the sea."
	done

ScarletCityPokefanF1Text:
	text "What do you want?"

	para "I'm just taking a"
	line "little stroll."

	para "If you're bored,"
	line "go take a look"

	para "at the RED ROCK"
	line "LABORATORY."

	para "They raise all"
	line "sorts of ancient"
	cont "#MON there."
	done

ScarletCityPokefanF2Text:
	text "They say the"
	line "crater to the"

	para "west has been"
	line "formed by the"

	para "impact of a"
	line "large meteor."

	para "I'd stay away from"
	line "such a dangerous"

	para "place, if I were"
	line "you."
	done

ScarletCityPokefanM1Text:
	text "This city was"
	line "built around"

	para "three years"
	line "ago."

	para "From what I heard,"
	line "it's thanks to the"

	para "continued support"
	line "of the SCIENTIST"

	para "GUILD that this"
	line "place has held up"
	cont "so well."
	done

ScarletCityStandingYoungsterText:
	text "Ah! The BATTLE"
	line "TOWER!"

	para "Three years ago,"
	line "a trainer named"

	para "RED came to"
	line "these islands,"

	para "and inspired its"
	line "inhabitants to"

	para "reach for greater"
	line "heights."

	para "With funding from"
	line "the SCIENTIST"

	para "GUILD, the people"
	line "managed to build"

	para "this magnificent"
	line "structure."
	done

ScarletCityPokefanM2Text:
	text "Hey, you're a"
	line "TRAINER, right?"

	para "If you haven't yet,"
	line "you should check"

	para "out the WHIRL"
	line "CUP competition!"

	para "TRAINERS challenge"
	line "the MASTERS of"
	cont "the COLOSSEUMS"

	para "scattered across"
	line "the WHIRL ISLANDS."

	para "The winner usually"
	line "gets a nifty"

	para "reward for their"
	line "efforts!"
	done

ScarletCityBeauty2Text:
	text "I'm gonna challenge"
	line "the MASTER of this"

	para "COLOSSEUM, and I'll"
	line "win, no sweat!"
	done

ScarletCitySignText:
	text "SCARLET CITY"

	para "A Crimson Mark"
	line "of Legacy!"
	done

ScarletGymSignText:
	text "SCARLET CITY"
	line "COLOSSEUM"
	cont "of WATER"

	para "MASTER: WHAYNE"

	para "Admirer of the"
	line "Cold Depths"
	done

BattleTowerSignText:
	text "BATTLE TOWER"
	line "straight ahead!"
	done

LabSignText:
	text "RED ROCK ISLE"
	line "PRESERVATION"
	cont "LABORATORY"

	para "Preservation of"
	line "ancient #MON"

	para "is our highest"
	line "priority!"

	para "- SCIENTIST GUILD"
	done

OutlookSignText:
	text "RED ROCK"
	line "OUTLOOK"
	cont "ahead"
	done

ScarletCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 21, 15, SCARLET_MART, 1 ; 1
	warp_event 27, 15, SCARLET_POKECENTER_1F, 1 ; 2
	warp_event 23,  5, ROUTE_40_BATTLE_TOWER_GATE, 1 ; 3
	warp_event 14, 15, WHIRL_CUP_COLOSSEUM, 1 ; 4
	warp_event 13, 25, SCARLET_HOUSE_1, 1 ; 5
	warp_event 21, 25, SCARLET_HOUSE_2, 1 ; 6
	warp_event 17, 21, SCARLET_OLD_HOUSE, 1 ; 7
	warp_event 27, 27, RED_ROCK_LAB, 1 ; 8

	def_coord_events

	def_bg_events
	bg_event 7, 11, BGEVENT_READ, ScarletCitySign
	bg_event 16, 16, BGEVENT_READ, ScarletGymSign
	bg_event  25,  7, BGEVENT_READ, BattleTowerSign
	bg_event 31,  27, BGEVENT_READ, LabSign
	bg_event 3, 21, BGEVENT_READ, OutlookSign

	def_object_events
	object_event 27, 30, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ScarletCityLassScript, -1
	object_event 17,  7, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ScarletCityBeauty1Script, -1
	object_event 25,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ScarletCitySailorScript, -1
	object_event 27,  9, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ScarletCitySuperNerdScript, -1
	object_event 24, 20, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ScarletCityPokefanF1Script, -1
	object_event 11, 21, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ScarletCityPokefanF2Script, -1
	object_event 34, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ScarletCityPokefanM1Script, -1
	object_event 22,  8, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ScarletCityStandingYoungsterScript, -1
	object_event  6, 20, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ScarletCityPokefanM2Script, -1
	object_event 13, 17, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ScarletCityBeauty2Script, -1
