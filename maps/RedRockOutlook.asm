	object_const_def
	const REDROCKOUTLOOK_ROCK1
	const REDROCKOUTLOOK_ROCK2
	const REDROCKOUTLOOK_ROCK3
	const REDROCKOUTLOOK_ROCK4
	const REDROCKOUTLOOK_ROCK5
	const REDROCKOUTLOOK_ROCK6
	const REDROCKOUTLOOK_ROCK7

RedRockOutlook_MapScripts:
	def_scene_scripts

	def_callbacks

CraterSign:
	jumptext CraterSignText

RedRockOutlookRock:
	jumpstd SmashRockScript

RedRockOutlookHiddenFireStone:
	hiddenitem FIRE_STONE, EVENT_RED_ROCK_OUTLOOK_HIDDEN_FIRE_STONE

CraterSignText:
	text "SEARING CRATER"

	para "DANGER!"
	done

RedRockOutlook_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 13, SEARING_CRATER_1F, 1

	def_coord_events

	def_bg_events
	bg_event 8, 14, BGEVENT_READ, CraterSign
	bg_event  6, 30, BGEVENT_ITEM, RedRockOutlookHiddenFireStone

	def_object_events
	object_event 38, 21, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedRockOutlookRock, -1
	object_event 39, 13, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedRockOutlookRock, -1
	object_event 10, 15, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedRockOutlookRock, -1
	object_event  5, 31, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedRockOutlookRock, -1
	object_event  6, 30, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedRockOutlookRock, -1
	object_event  7, 30, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedRockOutlookRock, -1
	object_event  4, 29, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedRockOutlookRock, -1
