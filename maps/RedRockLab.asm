	object_const_def
	const REDROCKLAB_SCIENTIST1
	const REDROCKLAB_SCIENTIST2
	const REDROCKLAB_SCIENTIST3
	const REDROCKLAB_SCIENTIST4

RedRockLab_MapScripts:
	def_scene_scripts

	def_callbacks

RedRockLabScientist1Script:
	jumptextfaceplayer RedRockLabScientist1Text

RedRockLabScientist2Script:
	jumptextfaceplayer RedRockLabScientist2Text

RedRockLabScientist3Script:
	jumptextfaceplayer RedRockLabScientist3Text

RedRockLabScientist4Script:
	faceplayer
	opentext
	checkevent EVENT_BEAT_WHAYNE
	iftrue .Allow
	writetext RedRockLabScientist4Text
	waitbutton
	closetext
	end

.Allow:
	writetext RedRockLabScientist4AllowText
	applymovement REDROCKLAB_SCIENTIST4, Scientist4Movement
	setflag EVENT_SCIENTIST_4_MOVED
	end

MovementData_Scientist4Movement
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	turn_head DOWN

RedRockLabScientist1Text:
	text "test"
	done

RedRockLabScientist2Text:
	text "test"
	done

RedRockLabScientist3Text:
	text "test"
	done

RedRockLabScientist4Text:
	text "test"
	done

RedRockLabScientist4AllowText:
	text "test"
	done

RedRockLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, SCARLET_CITY, 8
	warp_event  5,  7, SCARLET_CITY, 8
	warp_event 15,  2, RED_ROCK_LAB_BREEDING, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedRockLabScientist1Script, -1
	object_event  2,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedRockLabScientist2Script, -1
	object_event  3,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedRockLabScientist3Script, -1
	object_event  4,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedRockLabScientist4Script, -1
