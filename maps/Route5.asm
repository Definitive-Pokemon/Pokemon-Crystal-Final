	object_const_def
	const ROUTE5_POKEFAN_M
	const ROUTE5_SCIENTIST

Route5_MapScripts:
	def_scene_scripts

	def_callbacks

Route5PokefanMScript:
	jumptextfaceplayer Route5PokefanMText

Route5SilphEmployee1Script:
	jumptextfaceplayer Route5SilphEmployeeText

Route5SilphEmployee2Script:
	jumptextfaceplayer Route5SilphEmployeeText	

Route5UndergroundPathSign:
	jumptext Route5UndergroundPathSignText

HouseForSaleSign:
	jumptext HouseForSaleSignText

Route5PokefanMText:
	text "The road is closed"
	line "until the problem"

	para "at the POWER PLANT"
	line "is solved."
	done

Route5SilphEmployeeText
	text "Nobody is allowed to"
	line "leave SAFFRON CITY,"

	para "due to the execution"
	line "of our grand project!"

	para "SILPH CO. is about"
	line "to break new ground!"
	done

Route5UndergroundPathSignText:
	text "UNDERGROUND PATH"

	para "CERULEAN CITY -"
	line "VERMILION CITY"
	done

HouseForSaleSignText:
	text "What's this?"

	para "House for Sale…"
	line "Nobody lives here."
	done

Route5_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 15, ROUTE_5_UNDERGROUND_PATH_ENTRANCE, 1
	warp_event  8, 17, ROUTE_5_SAFFRON_GATE, 1
	warp_event  9, 17, ROUTE_5_SAFFRON_GATE, 2
	warp_event 10, 11, ROUTE_5_CLEANSE_TAG_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 17, 17, BGEVENT_READ, Route5UndergroundPathSign
	bg_event 10, 11, BGEVENT_READ, HouseForSaleSign

	def_object_events
	object_event 17, 16, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route5PokefanMScript, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event 17, 16, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route5PokefanMScript, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event  8, 16, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route5SilphEmployee1Script, EVENT_BEAT_RIVAL_IN_MT_MOON
	object_event  9, 16, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route5SilphEmployee2Script, EVENT_BEAT_RIVAL_IN_MT_MOON
