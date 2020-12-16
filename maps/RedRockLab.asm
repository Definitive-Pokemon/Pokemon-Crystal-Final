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
	checkevent EVENT_SCIENTIST_4_MOVED
	iftrue .GoOn
	checkevent EVENT_BEAT_WHAYNE
	iftrue .Allow
	writetext RedRockLabScientist4Text
	waitbutton
	closetext
	end

.Allow:
	writetext RedRockLabScientist4AllowText
	waitbutton
	closetext
	applymovement REDROCKLAB_SCIENTIST4, Scientist4Movement
	setevent EVENT_SCIENTIST_4_MOVED
	end

.GoOn:
	faceplayer
	writetext RedRockLabScientist4GoOnText
	waitbutton
	closetext
	end

Scientist4Movement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step_end

RedRockLabScientist1Text:
	text "This machine?"

	para "It restores #-"
	line "MON FOSSILS!"

	para "We bring back"
	line "#MON from"
	cont "the past!"

	para "Amazing, isn't it?"
	done

RedRockLabScientist2Text:
	text "We managed to"
	line "breed with the"

	para "#MON we"
	line "received from"
	cont "TRAINER RED."

	para "FOSSILS are in-"
	line "credibly rare."

	para "But with our bree-"
	line "ing program,"

	para "we barely even"
	line "need them!"
	done

RedRockLabScientist3Text:
	text "We sure manage to"
	line "make a lot of"

	para "money selling"
	line "FOSSIL #MON"
	cont "to TRAINERS."

	para "This, in turn,"
	line "allows us to"

	para "continue to raise"
	line "these #MON."

	para "It's real charity"
	line "work."
	done

RedRockLabScientist4Text:
	text "I'm very sorry, but"
	line "I can't allow"

	para "access to the"
	line "BREEDING GROUNDS."
	done

RedRockLabScientist4AllowText:
	text "You beat MASTER"
	line "WHAYNE?!"

	para "Incredible!"

	para "You deserve a"
	line "reward indeed!"

	para "Head down the"
	line "stairs to witness"

	para "something"
	line "amazing!"
	done

RedRockLabScientist4GoOnText:
	text "Go on!"
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
	object_event  4,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedRockLabScientist1Script, -1
	object_event  4,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedRockLabScientist2Script, -1
	object_event  9,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedRockLabScientist3Script, -1
	object_event 10,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedRockLabScientist4Script, EVENT_SCIENTIST_4_MOVED
