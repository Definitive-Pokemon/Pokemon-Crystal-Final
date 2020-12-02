	object_const_def
	const SCARLETMART_CLERK
	const SCARLETMART_ROCKET
	const SCARLETMART_GENTLEMAN

ScarletMart_MapScripts:
	def_scene_scripts

	def_callbacks

ScarletMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_SCARLET
	closetext
	end

ScarletMartRocketScript:
	jumptextfaceplayer ScarletMartRocketText

ScarletMartGentlemanScript:
	jumptextfaceplayer ScarletMartGentlemanText

ScarletMartRocketText:
	text "What're you staring"
	line "at!"

	para "Us GRUNTS need"
	line "food too!"
	done

ScarletMartGentlemanText:
	text "They sell quite a"
	line "lot of goods here."

	para "It comes cheap"
	line "too!"
	done

ScarletMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SCARLET_CITY, 1
	warp_event  3,  7, SCARLET_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ScarletMartClerkScript, -1
	object_event  1,  1, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ScarletMartRocketScript, -1
	object_event  1,  2, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ScarletMartGentlemanScript, -1
