	object_const_def
	const ROUTE8SAFFRONGATE_OFFICER

Route8SaffronGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route8SaffronGateOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_CENTRAL_KANTO_ROCKET_BEATEN
	iftrue .Normal
	writetext Route8SaffronGateOfficerText
	waitbutton
	closetext
	end

.Normal:
	writetext Route8SaffronGateOfficerWeirdText
	waitbutton
	closetext
	end

Route8SaffronGateOfficerText:
	text "Have you been to"
	line "LAVENDER TOWN?"

	para "There's a tall"
	line "RADIO TOWER there."
	done

Route8SaffronGateOfficerWeirdText:
	text "I think it's a bit"
	line "too much, all this"
	cont "blocking off gates."
	done

Route8SaffronGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, SAFFRON_CITY, 14
	warp_event  0,  5, SAFFRON_CITY, 15
	warp_event  9,  4, ROUTE_8, 1
	warp_event  9,  5, ROUTE_8, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route8SaffronGateOfficerScript, -1
