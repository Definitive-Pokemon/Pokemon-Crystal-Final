	object_const_def

RedRockLabBreeding_MapScripts:
	def_scene_scripts

	def_callbacks

RedRockLabBreedingWater:
	itemball WATER_STONE

RedRockLabBreeding_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 21, 11, RED_ROCK_LAB, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event 1,  18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RedRockLabBreedingWater, EVENT_RED_ROCK_LAB_BREEDING_WATER