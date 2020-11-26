	object_const_def

RedRockOutlook_MapScripts:
	def_scene_scripts

	def_callbacks

CraterSign:
	jumptext CraterSignText

RedRockOutlookUltra:
	itemball ULTRA_BALL

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

	def_object_events
	object_event 5,  30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RedRockOutlookUltra, EVENT_RED_ROCK_OUTLOOK_ULTRA