	object_const_def
	const REDROCKISLE_ROCK1
	const REDROCKISLE_ROCK2
	const REDROCKISLE_ROCK3
	const REDROCKISLE_ROCK4

RedRockIsle_MapScripts:
	def_scene_scripts

	def_callbacks

RedRockSign:
	jumptext RedRockSignText

RedRockScarletSign:
	jumptext RedRockScarletSignText

RedRockIsleRock:
	jumpstd SmashRockScript

RedRockIsleHiddenLeafStone
	hiddenitem LEAF_STONE, EVENT_RED_ROCK_ISLE_HIDDEN_LEAF_STONE

RedRockIsleHiddenNugget
	hiddenitem NUGGET, EVENT_RED_ROCK_ISLE_HIDDEN_NUGGET

RedRockSignText:
	text "Welcome to"
	line "RED ROCK ISLE"
	done

RedRockScarletSignText:
	text "RED ROCK ISLE"

	para "SCARLET CITY"
	done

RedRockIsle_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 4, 6, BGEVENT_READ, RedRockSign
	bg_event 8, 24, BGEVENT_READ, RedRockScarletSign
	bg_event 12, 30, BGEVENT_ITEM, RedRockIsleHiddenLeafStone
	bg_event 14, 12, BGEVENT_ITEM, RedRockIsleHiddenNugget

	def_object_events
	object_event  6, 15, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedRockIsleRock, -1
	object_event 15, 20, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedRockIsleRock, -1
	object_event 14, 12, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedRockIsleRock, -1
	object_event  8,  6, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedRockIsleRock, -1
