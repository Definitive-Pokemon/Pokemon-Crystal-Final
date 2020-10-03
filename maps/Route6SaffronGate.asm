	object_const_def
	const ROUTE6SAFFRONGATE_OFFICER

Route6SaffronGate_MapScripts:
	def_scene_scripts
	scene_script .DummyScene

	def_callbacks

.DummyScene:
	end

Route6SaffronGuardScript:
	faceplayer
	opentext
	checkevent EVENT_CENTRAL_KANTO_ROCKET_BEATEN
	iftrue .Normal
	writetext Route6SaffronGuardWelcomeText
	waitbutton
	closetext
	end

.Normal:
	writetext Route6SaffronGuardMagnetTrainText
	waitbutton
	closetext
	end

Route6SaffronGuardWelcomeText:
	text "Something strange"
	line "is going on."

	para "As soon as the"
	line "problems at the" 

	para "POWER PLANT were"
	line "solved, employees"

	para "from SILPH CO."
	line "became active"
	cont "like never before."

	para "It's as if they're"
	line "planning something"
	cont "big."
	done

Route6SaffronGuardMagnetTrainText:
	text "The MAGNET TRAIN"
	line "is the most famous"

	para "thing about SAF-"
	line "FRON."
	done

Route6SaffronGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, SAFFRON_CITY, 12
	warp_event  5,  0, SAFFRON_CITY, 13
	warp_event  4,  7, ROUTE_6, 2
	warp_event  5,  7, ROUTE_6, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route6SaffronGuardScript, -1
