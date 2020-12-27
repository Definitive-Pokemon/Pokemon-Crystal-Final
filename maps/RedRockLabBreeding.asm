	object_const_def
	const REDROCKLABBREEDING_SCIENTIST
	const REDROCKLABBREEDING_KABUTO1
	const REDROCKLABBREEDING_KABUTO2
	const REDROCKLABBREEDING_KABUTO3
	const REDROCKLABBREEDING_KABUTO4
	const REDROCKLABBREEDING_OMANYTE1
	const REDROCKLABBREEDING_OMANYTE2
	const REDROCKLABBREEDING_OMANYTE3
	const REDROCKLABBREEDING_POKE_BALL1

RedRockLabBreeding_MapScripts:
	def_scene_scripts

	def_callbacks

RedRockLabBreedingScientistScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_FOSSIL
	iftrue .AlreadyGot
	writetext RedRockLabBreedingScientistText
	yesorno
	iffalse .Omanyte
	playsound SFX_ELEVATOR_END
	writetext RedRockLabBreedingScientistCorrectText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext RedRockLabBreedingReceiveKabutoText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke KABUTO, 20
	setevent EVENT_GOT_FOSSIL
	writetext RedRockLabBreedingScientistYayText
	waitbutton
	closetext
	end	

.Omanyte:
	playsound SFX_ELEVATOR_END
	writetext RedRockLabBreedingScientistCorrectText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext RedRockLabBreedingReceiveOmanyteText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke OMANYTE, 20
	setevent EVENT_GOT_FOSSIL
	writetext RedRockLabBreedingScientistYayText
	waitbutton
	closetext
	end

.AlreadyGot:
	writetext RedRockLabBreedingScientistYayText
	waitbutton
	closetext
	end

.NoRoom:
	writetext RedRockLabBreedingScientistFullText
	waitbutton
	closetext
	end

RedRockLabBreedingKabutoScript:
	opentext
	writetext RedRockLabBreedingKabutoText
	cry KABUTO
	waitbutton
	closetext
	end

RedRockLabBreedingOmanyteScript:
	opentext
	writetext RedRockLabBreedingOmanyteText
	cry OMANYTE
	waitbutton
	closetext
	end

RedRockLabBreedingScientistText:
	text "Oh hey! Seems"
	line "you've been"

	para "given permission"
	line "to pay us a visit."

	para "What do you think?"
	line "Cool, isn't it?"

	para "You know what,"
	line "you can have"

	para "one of our #-"
	line "MON!"

	para "That is, if you"
	line "can manage to"

	para "guess which of"
	line "the two FOSSIL"

	para "#MON RED,"
	line "the CHAMPION,"

	para "chose to take"
	line "during his trek"
	cont "through MT. MOON."

	para "So, which one do"
	line "you think he took?"

	para "Do you think he"
	line "chose OMANYTE?"
	done

RedRockLabBreedingScientistCorrectText:
	text "Correct!"

	para "You deserve this!"
	done

RedRockLabBreedingReceiveKabutoText:
	text "<PLAYER> received"
	line "KABUTO."
	done

RedRockLabBreedingReceiveOmanyteText:
	text "<PLAYER> received"
	line "OMANYTE."
	done

RedRockLabBreedingScientistFullText:
	text "You have no room"
	line "in your party!"
	done

RedRockLabBreedingScientistYayText:
	text "I hope you will"
	line "raise this #-"
	cont "MON well!"
	done

RedRockLabBreedingKabutoText:
	text "KABUTO: Idaaa!"
	done

RedRockLabBreedingOmanyteText:
	text "OMANYTE: Omaaa!"
	done

RedRockLabBreedingWater:
	itemball WATER_STONE

RedRockLabBreeding_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 21, 11, RED_ROCK_LAB, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedRockLabBreedingScientistScript, -1
	object_event 20, 17, SPRITE_KABUTO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedRockLabBreedingKabutoScript, -1
	object_event 12,  5, SPRITE_KABUTO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedRockLabBreedingKabutoScript, -1
	object_event 11, 19, SPRITE_KABUTO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedRockLabBreedingKabutoScript, -1
	object_event  8, 12, SPRITE_KABUTO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedRockLabBreedingKabutoScript, -1
	object_event 12, 11, SPRITE_OMANYTE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RedRockLabBreedingOmanyteScript, -1
	object_event  3, 18, SPRITE_OMANYTE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RedRockLabBreedingOmanyteScript, -1
	object_event 14, 13, SPRITE_OMANYTE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RedRockLabBreedingOmanyteScript, -1
	object_event 1,  18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RedRockLabBreedingWater, EVENT_RED_ROCK_LAB_BREEDING_WATER
	