	object_const_def
	const SEARINGCRATER1F_ROCKET1
	const SEARINGCRATER1F_SCIENTIST1
	const SEARINGCRATER1F_POKE_BALL1
	const SEARINGCRATER1F_POKE_BALL2
	const SEARINGCRATER1F_POKE_BALL3

SearingCrater1F_MapScripts:
	def_scene_scripts

	def_callbacks

SearingCraterRocketScript:
	faceplayer
	opentext
	writetext SearingCraterRocketText
	waitbutton
	closetext
	end

SearingCraterScientistScript:
	checkevent EVENT_SEARING_CRATER_ROCKET
	iftrue .SearingCraterScientistTalkScript
	opentext
	writetext SearingCraterEvent1Text
	waitbutton
	closetext
	applymovement SEARINGCRATER1F_ROCKET1, RocketMovement1
	opentext
	writetext SearingCraterEvent2Text
	waitbutton
	closetext
	applymovement SEARINGCRATER1F_SCIENTIST1, ScientistMovement2
	opentext
	writetext SearingCraterEvent3Text
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SEARINGCRATER1F_ROCKET1, 15
	opentext
	writetext SearingCraterEvent4Text
	waitbutton
	closetext
	applymovement SEARINGCRATER1F_ROCKET1, RocketMovement3
	setevent EVENT_SEARING_CRATER_ROCKET
	applymovement SEARINGCRATER1F_SCIENTIST1, ScientistMovement3
	turnobject SEARINGCRATER1F_SCIENTIST1, UP
	end

.SearingCraterScientistTalkScript:
	faceplayer
	opentext
	writetext SearingCraterScientistText
	waitbutton
	closetext
	end

SearingCraterMoon:
	itemball MOON_STONE

SearingCraterHyper:
	itemball HYPER_POTION

SearingCraterRoot:
	itemball ENERGY_ROOT

RocketMovement1:
	turn_head RIGHT
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

ScientistMovement2:
	slow_step LEFT
	step_end

RocketMovement3:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	hide_object
	step_end

ScientistMovement3:
	slow_step RIGHT
	turn_head UP
	step_end

SearingCraterRocketText:
	text "And what are you"
	line "doing here?"

	para "Don't you see"
	line "I'm talking to"
	cont "this fool?"
	done

SearingCraterEvent1Text:
	text "TEAM ROCKET has"
	line "fallen years ago."

	para "Now please leave"
	line "this place, scum!"
	done

SearingCraterEvent2Text:
	text "Our GIOVANNI"
	line "would never"
	cont "abandon us!"

	para "Who do you think"
	line "think you are,"

	para "spreading news"
	line "as fake as this!?"
	done

SearingCraterEvent3Text:
	text "You can say"
	line "that again!"

	para "Just leave MOL-"
	line "TRES alone."
	done

SearingCraterEvent4Text:
	text "You can't"
	line "fool me!"

	para "The thing living"
	line "down there is"
	cont "no MOLTRES!"

	para "Whatever."
	line  "I'm leaving."

	para "No need to"
	line "bother with"
	cont "a fake."
	done

SearingCraterScientistText:
	text "I'm sorry, I"
	line "can't let you go"
	cont "past here."

	para "That GRUNT"
	line "snuck into"

	para "the crater"
	line "behind me."

	para "Clearly, he had"
	line "set his sights on"

	para "the legendary bird"
	line "named MOLTRES."

	para "Luckily, I was"
	line "just doing my"
	cont "daily round."

	para "I quickly dragged"
	line "him away from"
	cont "there."

	para "And now, he's"
	line "spouting all kinds"
	cont "of nonsense."

	para "I'm glad you"
	line "appeared just"

	para "as I was confron-"
	line "ting the thug."

	para "Things might"
	line "have turned"

	para "out differently"
	line "otherwise…"
	done

SearingCrater1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15, 27, RED_ROCK_OUTLOOK, 1
	warp_event 15, 15, SEARING_CRATER_B1F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 14,  8, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SearingCraterRocketScript, EVENT_SEARING_CRATER_ROCKET
	object_event 15,  8, SPRITE_SCIENTIST,	SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SearingCraterScientistScript, 0
	object_event 21,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SearingCraterMoon, EVENT_SEARING_CRATER_MOON
	object_event 2,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SearingCraterHyper, EVENT_SEARING_CRATER_HYPER
	object_event 5,  13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SearingCraterRoot, EVENT_SEARING_CRATER_ROOT
