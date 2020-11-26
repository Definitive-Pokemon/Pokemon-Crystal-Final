	object_const_def

SearingCrater1F_MapScripts:
	def_scene_scripts

	def_callbacks

SearingCraterMoon:
	itemball MOON_STONE

SearingCraterHyper:
	itemball HYPER_POTION

SearingCraterRoot:
	itemball ENERGY_ROOT

SearingCrater1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15, 27, RED_ROCK_OUTLOOK, 1
	warp_event 15, 15, SEARING_CRATER_B1F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 21,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SearingCraterMoon, EVENT_SEARING_CRATER_MOON
	object_event 2,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SearingCraterHyper, EVENT_SEARING_CRATER_HYPER
	object_event 5,  13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SearingCraterRoot, EVENT_SEARING_CRATER_ROOT
