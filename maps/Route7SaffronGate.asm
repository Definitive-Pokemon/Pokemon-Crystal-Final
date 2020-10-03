	object_const_def
	const ROUTE7SAFFRONGATE_OFFICER

Route7SaffronGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route7SaffronGuardScript:
	faceplayer
	opentext
	checkevent EVENT_CENTRAL_KANTO_ROCKET_BEATEN
	iftrue .Normal
	writetext Route7SaffronGuardPowerPlantText
	waitbutton
	closetext
	end

.Normal:
	writetext Route7SaffronGuardSeriousText
	waitbutton
	closetext
	end

Route7SaffronGuardPowerPlantText:
	text "SILPH CO. has"
	line "received our"

	para "permission to"
	line "install people"

	para "in front of the"
	line "gates to the city."

	para "I guess they're"
	line "afraid of people"

	para "stealing their"
	line "latest project."

	para "I can't blame"
	line "them, after what"

	para "happened three"
	line "years ago."

	para "TEAM ROCKET"
	line "attempted to"

	para "steal the formula"
	line "of SILPH's MASTER"
	cont "BALL."

	para "They were stopped"
	line "by a boy with a"
	cont "red hat."

	para "Miraculous, isn't it?"
	done

Route7SaffronGuardSeriousText:
	text "I take my GUARD"
	line "job seriously."

	para "Hey! You have a"
	line "#DEX, just"

	para "like the boy with"
	line "the red hat."

	para "OK. You can go"
	line "through."
	done

Route7SaffronGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, ROUTE_7, 1
	warp_event  0,  5, ROUTE_7, 2
	warp_event  9,  4, SAFFRON_CITY, 10
	warp_event  9,  5, SAFFRON_CITY, 11

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route7SaffronGuardScript, -1
