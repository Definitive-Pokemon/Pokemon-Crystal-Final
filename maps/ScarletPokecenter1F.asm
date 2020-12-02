	object_const_def
	const SCARLETPOKECENTER1F_NURSE
	const SCARLETPOKECENTER1F_FISHING_GURU
	const SCARLETPOKECENTER1F_COOLTRAINER_M
	const SCARLETPOKECENTER1F_SAILOR

ScarletPokecenter1F_MapScripts:
	def_scene_scripts
	scene_script .DummyScene

	def_callbacks

.DummyScene:
	end

ScarletPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

ScarletPokecenter1FFishingGuruScript:
	jumptextfaceplayer ScarletPokecenter1FFishingGuruText

ScarletPokecenter1FCooltrainerMScript:
	jumptextfaceplayer ScarletPokecenter1FCooltrainerMText

ScarletPokecenter1FSailorScript:
	jumptextfaceplayer ScarletPokecenter1FSailorText

ScarletPokecenter1FFishingGuruText:
	text "Occasionally, I see"
	line "ships sailing past"

	para "this island, heading"
	line "towards CIANWOOD."

	para "I think they stock up"
	line "on medicine there."
	done

ScarletPokecenter1FCooltrainerMText:
	text "The MASTER of the"
	line "COLOSSEUM here"

	para "has an unusually"
	line "diverse team."

	para "I'd be careful"
	line "rushing into"
	cont "battle."
	done

ScarletPokecenter1FSailorText:
	text "Ahhh!"

	para "Finally, a well-"
	line "deserved rest!"
	done

ScarletPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, SCARLET_CITY, 2
	warp_event  4,  7, SCARLET_CITY, 2
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ScarletPokecenter1FNurseScript, -1
	object_event  9,  6, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ScarletPokecenter1FFishingGuruScript, -1
	object_event  5,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ScarletPokecenter1FCooltrainerMScript, -1
	object_event  6,  1, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ScarletPokecenter1FSailorScript, -1
