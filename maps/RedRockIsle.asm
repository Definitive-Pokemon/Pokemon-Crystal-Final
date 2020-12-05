	object_const_def
	const REDROCKISLE_ROCK1
	const REDROCKISLE_ROCK2
	const REDROCKISLE_ROCK3
	const REDROCKISLE_ROCK4
	const REDROCKISLE_SWIMMER_GUY
	const REDROCKISLE_SAILOR
	const REDROCKISLE_SUPER_NERD

RedRockIsle_MapScripts:
	def_scene_scripts

	def_callbacks

RedRockSign:
	jumptext RedRockSignText

RedRockScarletSign:
	jumptext RedRockScarletSignText

RedRockIsleRock:
	jumpstd SmashRockScript

RedRockIsleHiddenLeafStone
	hiddenitem LEAF_STONE, EVENT_RED_ROCK_ISLE_HIDDEN_LEAF_STONE

RedRockIsleHiddenNugget
	hiddenitem NUGGET, EVENT_RED_ROCK_ISLE_HIDDEN_NUGGET

TrainerSwimmermEdwin:
	trainer SWIMMERM, EDWIN, EVENT_BEAT_SWIMMERM_EDWIN, SwimmermEdwinSeenText, SwimmermEdwinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermEdwinAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorBarron:
	trainer SAILOR, BARRON, EVENT_BEAT_SAILOR_BARRON, SailorBarronSeenText, SailorBarronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorBarronAfterBattleText
	waitbutton
	closetext
	end

TrainerSuperNerdMartien:
	trainer SUPER_NERD, MARTIEN, EVENT_BEAT_SUPER_NERD_MARTIEN, SuperNerdMartienSeenText, SuperNerdMartienBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SuperNerdMartienAfterBattleText
	waitbutton
	closetext
	end

RedRockSignText:
	text "Welcome to"
	line "RED ROCK ISLE"
	done

RedRockScarletSignText:
	text "RED ROCK ISLE"

	para "SCARLET CITY"
	done

SwimmermEdwinSeenText:
	text "We're not done"
	line "swimming yet!"
	done

SwimmermEdwinBeatenText:
	text "Phew, I'm done…"
	done

SwimmermEdwinAfterBattleText:
	text "I'll let you go,"
	line "but come back"

	para "next week for"
	line "more!"
	done

SailorBarronSeenText:
	text "The TOWER calls"
	line "to me…"

	para "Does it call"
	line "you too?"
	done

SailorBarronBeatenText:
	text "I don't hear"
	line "anything."
	done

SailorBarronAfterBattleText:
	text "I'm sick of"
	line "battling!"

	para "But the view"
	line "is pleasant."
	done

SuperNerdMartienSeenText:
	text "Do you have it"
	line "in you to beat"
	cont "me?"
	done

SuperNerdMartienBeatenText:
	text "Seems you do."
	done

SuperNerdMartienAfterBattleText:
	text "Strong TRAINERS"
	line "should head to"

	para "the COLOSSEUM"
	line "in SCARLET CITY"

	para "and challenge"
	line "its MASTER."
	done

RedRockIsle_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 4, 6, BGEVENT_READ, RedRockSign
	bg_event 8, 24, BGEVENT_READ, RedRockScarletSign
	bg_event 12, 30, BGEVENT_ITEM, RedRockIsleHiddenLeafStone
	bg_event 14, 12, BGEVENT_ITEM, RedRockIsleHiddenNugget

	def_object_events
	object_event  6, 15, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedRockIsleRock, -1
	object_event 15, 20, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedRockIsleRock, -1
	object_event 14, 12, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedRockIsleRock, -1
	object_event  8,  6, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedRockIsleRock, -1
	object_event 16,  3, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermEdwin, -1
	object_event 10, 20, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerSailorBarron, -1
	object_event 13, 25, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSuperNerdMartien, -1
