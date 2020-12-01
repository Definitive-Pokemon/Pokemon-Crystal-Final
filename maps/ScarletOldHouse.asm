	object_const_def
	const SCARLETOLDHOUSE_GRANNY


ScarletOldHouse_MapScripts:
	def_scene_scripts

	def_callbacks

ScarletOldHouseGrannyScript:
	jumptextfaceplayer ScarletOldHouseGrannyText

ScarletOldHouseGrannyText:
	text "Before this city"
	line "was built, this"

	para "house was the only"
	line " one standing here."

	para "It's been inhabited"
	line "by a line of"

	para "protectors of the"
	line "WHIRL ISLANDS."

	para "I am the latest"
	line "of this line."

	para "I still protect"
	line "these islands."

	para "So don't provoke"
	line "me."
	done

ScarletOldHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, SCARLET_CITY, 7
	warp_event  4,  7, SCARLET_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ScarletOldHouseGrannyScript, -1
