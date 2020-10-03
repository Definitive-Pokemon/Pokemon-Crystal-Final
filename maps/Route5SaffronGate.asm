	object_const_def
	const ROUTE5SAFFRONGATE_OFFICER

Route5SaffronGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route5SaffronGateOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_CENTRAL_KANTO_ROCKET_BEATEN
	iftrue .Normal
	writetext Route5SilverCameText
	waitbutton
	closetext
	end

.Normal
	writetext Route5SaffronGateOfficerText
	waitbutton
	closetext
	end

Route5SilverCameText:
	text "You're the second"
	line "kid that comes"
	cont "running through!"

	para "Before you,"
	line "the guards came
	cont "through,"

	para "chased by a bunch"
	line "of #MON and"
	cont "a red-haired kid."

	para "SILPH paid us a"
	line "lot of money to"

	para "stop people using"
	line "these gates,"

	para "but it should be"
	line "okay to let some"
	cont "kids through, right?"
	done

Route5SaffronGateOfficerText:
	text "You're from JOHTO,"
	line "aren't you?"

	para "How do you like"
	line "KANTO? It's nice,"
	cont "don't you agree?"
	done

Route5SaffronGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, ROUTE_5, 2
	warp_event  5,  0, ROUTE_5, 3
	warp_event  4,  7, SAFFRON_CITY, 9
	warp_event  5,  7, SAFFRON_CITY, 9

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route5SaffronGateOfficerScript, -1
