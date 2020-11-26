	object_const_def
	const REDROCKISLE_POKE_BALL1
	const REDROCKISLE_POKE_BALL2

RedRockIsle_MapScripts:
	def_scene_scripts

	def_callbacks

RedRockSign:
	jumptext RedRockSignText

RedRockScarletSign:
	jumptext RedRockScarletSignText

RedRockIsleDoll:
	itemball POKE_DOLL

RedRockIsleFire:
	itemball FIRE_STONE

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

	def_coord_events

	def_bg_events
	bg_event 4, 6, BGEVENT_READ, RedRockSign
	bg_event 8, 24, BGEVENT_READ, RedRockScarletSign

	def_object_events
	object_event 12,  30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RedRockIsleDoll, EVENT_RED_ROCK_ISLE_DOLL
	object_event 4,  15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RedRockIsleFire, EVENT_RED_ROCK_ISLE_FIRE
