	object_const_def
	const SCARLETHOUSE2_FISHER
	const SCARLETHOUSE2_TEACHER
	const SCARLETHOUSE2_TWIN

ScarletHouse2_MapScripts:
	def_scene_scripts

	def_callbacks

ScarletHouse2FisherScript:
	jumptextfaceplayer ScarletHouse2FisherText

ScarletHouse2TeacerScript:
	jumptextfaceplayer ScarletHouse2TeacherText

ScarletHouse2TwinScript:
	jumptextfaceplayer ScarletHouse2TwinText

ScarletHouse2FisherText:
	text: "At night, the"
	line "waves hitting"

	para "the shore cause"
	line "such a peaceful"
	cont "sound."

	para "It's improved"
	line "our well-being"
	cont "tremendously."
	done

ScarletHouse2TeacherText:
	text "That old lady"
	line "living in the"

	para "house next"
	line "to ours…"

	para "Is it true what"
	line "she says?"
	done

ScarletHouse2TwinText:
	text "I wonder when"
	line "big sis is coming"
	cont "home…"

	para "She spends so"
	line "much time alone"
	cont "among the flowers!"
	done

ScarletHouse2_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SCARLET_CITY, 6
	warp_event  3,  7, SCARLET_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ScarletHouse2FisherScript, -1
	object_event  2,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ScarletHouse2TeacherScript, -1
	object_event  5,  6, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ScarletHouse2TwinScript, -1
