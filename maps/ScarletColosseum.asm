	object_const_def
	const SCARLETCOLOSSEUM_WHAYNE
	const SCARLETCOLOSSEUM_GYM_GUIDE

ScarletColosseum_MapScripts:
	def_scene_scripts

	def_callbacks

ScarletColosseumGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_WHAYNE
	iftrue .ScarletColosseumGymGuideWinScript
	writetext ScarletColosseumGymGuideText
	waitbutton
	closetext
	end

.ScarletColosseumGymGuideWinScript:
	writetext ScarletColosseumGymGuideWinText
	waitbutton
	closetext
	end

ScarletColosseumWhayneScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_WHAYNE
	iftrue .FightDone
	checkevent EVENT_ACCESS_TO_WHIRL
	iftrue .Scaling
	writetext WhayneIntroText
	waitbutton
	closetext
	winlosstext WhayneWinLossText, 0
	loadtrainer WHAYNE, WHAYNE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_WHAYNE
	opentext
	writetext BeatWhayneText
	playsound SFX_GET_BADGE
	waitsfx
.FightDone:
	writetext WhayneWinText
	waitbutton
	closetext
	end

.Scaling
	writetext WhayneIntroText
	waitbutton
	closetext
	winlosstext WhayneWinLossText, 0
	loadtrainer WHAYNE, WHAYNE2
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_WHAYNE
	opentext
	writetext BeatWhayneText
	playsound SFX_GET_BADGE
	waitsfx
	writetext WhayneWinText
	waitbutton
	closetext
	end

ScarletColosseumStatue:
	opentext
	checkevent EVENT_BEAT_WHAYNE
	iftrue .Beaten
	writetext ScarletColosseumStatueText
	waitbutton
	closetext
	end

.Beaten:
	writetext ScarletColosseumStatueWinText
	waitbutton
	closetext
	end

ScarletColosseumGymGuideText:
	text "Welcome to the"
	line "COLOSSEUM,"

	para "part of the WHIRL"
	line "CUP COMPETITION."

	para "You've come to me"
	line "for some advice?"

	para "All I can say"
	line "is that, though"

	para "this place is"
	line "based around the"

	para "water-type, its"
	line "MASTER uses a"

	para "varied team of no"
	line "less than five"
	cont "#MON."

	para "This won't be"
	line "easy, kid."
	done

ScarletColosseumGymGuideWinText:
	text "You actually"
	line "did it!"

	para "You're on your way"
	line "to be a legend."
	done

ScarletColosseumStatueText:
	text "SCARLET CITY"
	line "COLOSSEUM"

	para "MASTER: WHAYNE"
	done

ScarletColosseumStatueWinText:
	text "SCARLET CITY"
	line "COLOSSEUM"

	para "MASTER: WHAYNE"

	para "WINNING TRAINERS:"
	line "<PLAYER>"
	done

WhayneIntroText:
	text "And who…"
	line "are you?"

	para "So a scamp from"
	line "the mainland has"

	para "snuck into this"
	line "beautiful city to"
	cont "challenge me."

	para "Believe me, you"
	line "have no idea"

	para "what you are"
	line "getting yourself"
	cont "into."

	para "It is time for"
	line "you to learn"
	cont "your place."
	done

WhayneWinLossText:
	text "HISS!"
	line "YOU DARE TO"
	cont "MOCK ME?!"
	done

BeatWhayneText:
	text "Ah well…"
	line "It doesn't matter."

	para "It's only a BATTLE."
	line "No big deal."

	para "You won."
	done

WhayneWinText:
	text "I believe you"
	line "deserve a reward"
	cont "for your efforts."

	para "Speak to the"
	line "SCIENTIST watching"

	para "over the BREEDING"
	line "GROUNDS of the"
	cont "RED ROCK LAB."

	para "He will reward you"
	line "handsomely."
	done

ScarletColosseum_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 17, SCARLET_CITY, 4 ; 1
	warp_event  9, 17, SCARLET_CITY, 4 ; 2

	def_coord_events

	def_bg_events
	bg_event 10, 15, BGEVENT_READ, ScarletColosseumStatue
	bg_event  7, 15, BGEVENT_READ, ScarletColosseumStatue

	def_object_events
	object_event  8,  3, SPRITE_WHAYNE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ScarletColosseumWhayneScript, -1
	object_event 11, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ScarletColosseumGymGuideScript, -1
