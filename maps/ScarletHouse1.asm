	object_const_def
	const SCARLETHOUSE1_BLACK_BELT
	const SCARLETHOUSE1_BEAUTY

ScarletHouse1_MapScripts:
	def_scene_scripts

	def_callbacks

ScarletHouse1BlackBeltScript:
	jumptextfaceplayer ScarletHouse1BlackBeltText

ScarletHouse1BeautyScript:
	jumptextfaceplayer ScarletHouse1BeautyText

ScarletHouse1BlackBeltText:
	text "Darn it!"

	para "I keep losing at the"
	line "very end of the"
	cont "BATTLE TOWER."

	para "I hate having to start"
	line "all over again!"

	para "It's just not fair!"
	done

ScarletHouse1BeautyText:
	text "Instead of complaining"
	line "about his losses,"

	para "how about he took"
	line "some more time"
	cont "out for me?"
	done

ScarletHouse1_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SCARLET_CITY, 5
	warp_event  3,  7, SCARLET_CITY, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ScarletHouse1BlackBeltScript, -1
	object_event  5,  3, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ScarletHouse1BeautyScript, -1
