	object_const_def
	const WHIRLCUPCOLOSSEUM WHAYNE

WhirlCupColosseum_MapScripts:
	def_scene_scripts

	def_callbacks

WhirlCupColosseumWhayneScript:
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

	para "It is time for you"
	line "to learn your place."
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
	text "I think you deserve"
	line "a reward for your"
	cont "efforts."

	para "Speak to the"
	line "SCIENTIST watching"

	para "over the BREEDING"
	line "GROUNDS of the"
	cont "Red Rock Lab."

	para "He will reward you"
	line "handsomely."
	done

	


WhirlCupColosseum_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 17, SCARLET_CITY, 4 ; 1
	warp_event  9, 17, SCARLET_CITY, 4 ; 2

	def_coord_events

	def_bg_events

	def_object_events