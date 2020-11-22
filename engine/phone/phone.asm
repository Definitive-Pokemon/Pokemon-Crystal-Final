AddPhoneNumber::
	call _CheckCellNum
	jr c, .cant_add
	call SetBitAInHL
	xor a
	ret

.cant_add
	scf
	ret

DelCellNum::
	call _CheckCellNum
	jr nc, .not_in_list
	call ResBitAInHL
	ret

.not_in_list
	scf
	ret

CheckCellNum::
	jp _CheckCellNum ; useless

; Look up if requested phone number in c is registered
; Carry on number found
; Side effects: HL retains the address of the flag, a is the bit-index of the flag
_CheckCellNum:
	ld hl, wPhoneList
	ld a, c
	push bc
	ld c, 8
.loop
	cp c
	jr c, .inspect_flags
	inc hl
	ld b, a
	ld a, c
	add a, 8
	cp (CONTACT_LIST_FLAG_NUMBER + 1) * 8
	ld c, a
	ld a, b
	jr nz, .loop
.not_found
	pop bc
	ret

.inspect_flags
	ld b, a
	ld a, c
	sub 8
	ld c, a
	ld a, b
	sub a, c
	call CheckBitAInHL
	jr z, .not_found
	pop bc
	scf
	ret

Phone_FindOpenSlot:
	call GetRemainingSpaceInPhoneList
	ld b, a
	ld hl, wPhoneList
.loop
	ld a, [hli]
	and a
	jr z, .FoundOpenSpace
	dec b
	jr nz, .loop
	xor a
	ret

.FoundOpenSpace:
	dec hl
	scf
	ret

GetRemainingSpaceInPhoneList:
	xor a
	ld [wBuffer1], a
	ld hl, PermanentNumbers
.loop
	ld a, [hli]
	cp -1
	jr z, .done
	cp c
	jr z, .continue

	push bc
	push hl
	ld c, a
	call _CheckCellNum
	jr c, .permanent
	ld hl, wBuffer1
	inc [hl]
.permanent
	pop hl
	pop bc

.continue
	jr .loop

.done
	ld a, CONTACT_LIST_SIZE
	ld hl, wBuffer1
	sub [hl]
	ret

INCLUDE "data/phone/permanent_numbers.asm"

FarPlaceString:
	ldh a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

	call PlaceString

	pop af
	rst Bankswitch
	ret

CheckPhoneCall::
; Check if the phone is ringing in the overworld.

	call CheckStandingOnEntrance
	jr z, .no_call

	call .timecheck
	nop
	jr nc, .no_call

	call Random
	ld b, a
	and 50 percent
	cp b
	jr nz, .no_call

	call GetMapPhoneService
	and a
	jr nz, .no_call

	jp GetAvailableCallers
	; originally went into ChooseRandomCaller, but removed (now the link is managed with jumps)
	; this has been done to not disrupt the stack of build up phone numbers
	.no_call
	xor a
	ret

	.timecheck
	farcall CheckReceiveCallTimer
	ret
ResumeCheckPhoneCall::
	jr nc, .no_call

	ld e, a
	call LoadCallerScript
	ld a, BANK(Script_ReceivePhoneCall)
	ld hl, Script_ReceivePhoneCall
	call CallScript
	scf
	ret

.no_call
	xor a
	ret

.timecheck
	farcall CheckReceiveCallTimer
	ret

CheckPhoneContactTimeOfDay:
	push hl
	push bc
	push de
	push af

	farcall CheckTime
	pop af
	and ANYTIME
	and c

	pop de
	pop bc
	pop hl
	ret

ChooseRandomCaller:
; If no one is available to call, don't return anything.
	ld a, [wNumAvailableCallers]
	and a
	jr nz, .next_check
	xor a ; no numbers and thus return without carry
	jp ResumeCheckPhoneCall
	.next_check
	dec a
	jr nz, .sample ; if the count (a) is 1 return that number instantly
	pop bc
	ld a, b
	scf
	jp ResumeCheckPhoneCall
	.sample
	inc a ; fix a to original count
; Store the number of available callers in c.
	ld c, a
; Skewing the ratio towards swarms
    ; a = current phone number
	; b = temp
	; c = counter for amount of numbers left to check
	; de = push registers for skewing phone numbers
	; hl = pointer to stack content (phone number)
	ld hl, sp+$00
	bit 0, c ; check for uneven
	jr z, .skip_initial
	pop de
	dec c
	ld a, d ; check if first number already is a Swarm phone number
	cp PHONE_BUG_CATCHER_ARNIE
	jr z, .add_initial_skew
	cp PHONE_FISHER_RALPH
	jr z, .add_initial_skew
	cp PHONE_HIKER_ANTHONY
	jr nz, .dont_initial_skew
	.add_initial_skew
	; pushing code
	ld e, d
	push de
	push de ; push twice, for a total of four of the number
	ld a, [wNumAvailableCallers]
	add a, 3
	ld [wNumAvailableCallers], a
	ld d, 0 ; unset d, because we are now even
	.dont_initial_skew
	inc hl
	inc hl ; correct hl for the uneven numbers
	.skip_initial
	ld e, 0
	.loop
	ld a, [hl]
	cp PHONE_BUG_CATCHER_ARNIE
	jr z, .add_skew
	cp PHONE_FISHER_RALPH
	jr z, .add_skew
	cp PHONE_HIKER_ANTHONY
	jr nz, .dont_skew
	.add_skew
	ld b, a
	xor a
	cp d
	jr z, .push_even
	.push_uneven
	ld e, b
	push de
	ld d, e
	push de
	ld d, a ; a was still zero from comparing
	jr .add_skew_count
	.push_even
	ld d, b
	ld e, b
	push de
	.add_skew_count
	ld a, [wNumAvailableCallers]
	add a, 3
	ld [wNumAvailableCallers], a
	.dont_skew
	inc hl
	dec c
	jr nz, .loop ; keep going until all the non-skewed entries have been checked.
	; c is zero after
	xor a
	cp d ; correct if there are any phone numbers left to be pushed
	jr z, .generate_random
	ld e, a
	push de
	.generate_random
; Sample a random number between 0 and 63.
	call Random
	ldh a, [hRandomAdd]
	swap a
	and $3f ; originally 31 (0x1f), but expanded to account for all numbers
; Compute that number modulo the number of available callers.
	ld c, a
	ld a, [wNumAvailableCallers]
	ld d, a
	ld a, c ; restore sampled number
	ld c, d ; make sure available contacts is in c for a mod c
	call SimpleDivide
; Return the caller ID you just sampled.
	ld c, a
	ld b, 0
	ld hl, sp+$00
	add hl, bc
	ld a, [hl] ; retrieve randomly selected phone number
	ld c, a ; store the selected phone number in c for now
; Put stack pointer at where it started before GetAvailableCallers
	ld a, d
	bit 0, d ; check if there was an extra number
	jr z, .dont_correct
	add a, $01
	.dont_correct
	ld h, $00
	ld l, a
	add hl,sp
	ld sp, hl ; something makes stuff go on the wrong offset here
	ld a, c ; make sure the phone number is in a to be returned
; End of random number selection, set carry and jump back
	scf
	jp ResumeCheckPhoneCall


GetAvailableCallers:
	farcall CheckTime
	ld a, c
	ld [wCheckedTime], a
	ld hl, wNumAvailableCallers
	ld bc, CONTACT_LIST_SIZE + 1
	xor a
	call ByteFill
	ld de, wPhoneList
	ld a, 4 ; flag is incremented early
	ld [wAvailableCallers], a ; flag bit storage
	ld a, 5 ; skip  first 5 numbers, those can never be called normally

.loop
	ld [wPhoneListIndex], a ; set the phone number we are checking if it can call us.
	ld a, [wAvailableCallers]
	cp 7
	jr nz, .increment
	ld a, -1 ; reset flag bit position
	; update flag destination offset
	inc de ; select next flag byte
	.increment
	inc a
	ld [wAvailableCallers], a ; store flag bit
	ld c, a
	ld a, [de]
	ld b, a
	ld a, c
	call CheckBitAInB ; check if flag is even set
	jr z, .not_good_for_call
	ld hl, PhoneContacts + PHONE_CONTACT_SCRIPT2_TIME
	ld bc, PHONE_CONTACT_SIZE
	call AddNTimes
	ld a, [wCheckedTime]
	and [hl]
	jr z, .not_good_for_call
	ld bc, PHONE_CONTACT_MAP_GROUP - PHONE_CONTACT_SCRIPT2_TIME
	add hl, bc
	ld a, [wMapGroup]
	cp [hl]
	jr nz, .different_map
	inc hl
	ld a, [wMapNumber]
	cp [hl]
	jr z, .not_good_for_call
.different_map ; ups the found number counter and pushes the phone number
	ld a, [wNumAvailableCallers]
	inc a
	ld [wNumAvailableCallers], a
	; check if wAvailableCallers + 1 is not 00, then put number into c and push both
	ld hl,  wAvailableCallers + 1
	ld a, [hl]
	and a
	jr nz, .push_numbers
	; Put current number in the backup
	ld a, [wPhoneListIndex]
	ld [hl], a
	jr .not_good_for_call
	.push_numbers
	; Put current Number in b and load backup to c for push
	ld b, a
	ld a, [wPhoneListIndex]
	ld c, a
	xor a
	ld [hl], a
	push bc
.not_good_for_call
	ld a, [wPhoneListIndex]
	inc a 
	cp AMOUNT_OF_CONTACTS - 1 ; zero indexing fix
	jr nz, .loop
	ld a, [wAvailableCallers + 1]
	and a
	jr z, .done
	ld b, a
	push bc
	.done
	jp ChooseRandomCaller

CheckSpecialPhoneCall::
	ld a, [wSpecialPhoneCallID]
	and a
	jr z, .NoPhoneCall

	dec a
	ld c, a
	ld b, 0
	ld hl, SpecialPhoneCallList
	ld a, 6
	call AddNTimes
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call _hl_
	jr nc, .NoPhoneCall

	call .DoSpecialPhoneCall
	inc hl
	inc hl
	ld a, [hli]
	ld e, a
	push hl
	call LoadCallerScript
	pop hl
	ld de, wCallerContact + PHONE_CONTACT_SCRIPT2_BANK
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld a, BANK(.script)
	ld hl, .script
	call CallScript
	scf
	ret
.NoPhoneCall:
	xor a
	ret

.script
	pause 30
	sjump Script_ReceivePhoneCall

.DoSpecialPhoneCall:
	ld a, [wSpecialPhoneCallID]
	dec a
	ld c, a
	ld b, 0
	ld hl, SpecialPhoneCallList
	ld a, 6
	call AddNTimes
	ret

SpecialCallOnlyWhenOutside:
	ld a, [wEnvironment]
	cp TOWN
	jr z, .outside
	cp ROUTE
	jr z, .outside
	xor a
	ret

.outside
	scf
	ret

SpecialCallWhereverYouAre:
	scf
	ret

Function90199:
	; Don't do the call if you're in a link communication
	ld a, [wLinkMode]
	and a
	jr nz, .OutOfArea
	; If you're in an area without phone service, don't do the call
	call GetMapPhoneService
	and a
	jr nz, .OutOfArea
	; If the person can't take a call at that time, don't do the call
	ld a, b
	ld [wCurCaller], a
	ld hl, PhoneContacts
	ld bc, PHONE_CONTACT_SIZE
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, PHONE_CONTACT_SCRIPT1_TIME
	add hl, de
	ld a, [hl]
	call CheckPhoneContactTimeOfDay
	jr z, .OutOfArea
	; If we're in the same map as the person we're calling,
	; use the "Just talk to that person" script.
	ld hl, PHONE_CONTACT_MAP_GROUP
	add hl, de
	ld a, [wMapGroup]
	cp [hl]
	jr nz, .GetPhoneScript
	ld hl, PHONE_CONTACT_MAP_NUMBER
	add hl, de
	ld a, [wMapNumber]
	cp [hl]
	jr nz, .GetPhoneScript
	ld b, BANK(PhoneScript_JustTalkToThem)
	ld hl, PhoneScript_JustTalkToThem
	jr .DoPhoneCall

.GetPhoneScript:
	ld hl, PHONE_CONTACT_SCRIPT1_BANK
	add hl, de
	ld b, [hl]
	ld hl, PHONE_CONTACT_SCRIPT1_ADDR
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jr .DoPhoneCall

.OutOfArea:
	ld b, BANK(LoadOutOfAreaScript)
	ld de, LoadOutOfAreaScript
	call ExecuteCallbackScript
	ret

.DoPhoneCall:
	ld a, b
	ld [wPhoneScriptBank], a
	ld a, l
	ld [wPhoneCaller], a
	ld a, h
	ld [wPhoneCaller + 1], a
	ld b, BANK(LoadPhoneScriptBank)
	ld de, LoadPhoneScriptBank
	call ExecuteCallbackScript
	ret

LoadPhoneScriptBank:
	memcall wPhoneScriptBank
	endcallback

LoadOutOfAreaScript:
	scall PhoneOutOfAreaScript
	endcallback

LoadCallerScript:
	nop
	nop
	ld a, e
	ld [wCurCaller], a
	and a
	jr nz, .actualcaller
	ld a, BANK(WrongNumber)
	ld hl, WrongNumber
	jr .proceed

.actualcaller
	ld hl, PhoneContacts
	ld bc, PHONE_CONTACT_SIZE
	ld a, e
	call AddNTimes
	ld a, BANK(PhoneContacts)
.proceed
	ld de, wCallerContact
	ld bc, PHONE_CONTACT_SIZE
	call FarCopyBytes
	ret

WrongNumber:
	db TRAINER_NONE, PHONE_00
	dba .script
.script
	writetext .PhoneWrongNumberText
	end
.PhoneWrongNumberText:
	text_far _PhoneWrongNumberText
	text_end

Script_ReceivePhoneCall:
	refreshscreen
	callasm RingTwice_StartCall
	memcall wCallerContact + PHONE_CONTACT_SCRIPT2_BANK
	waitbutton
	callasm HangUp
	closetext
	callasm InitCallReceiveDelay
	end

Script_SpecialBillCall::
	callasm .LoadBillScript
	sjump Script_ReceivePhoneCall

.LoadBillScript:
	ld e, PHONE_BILL
	jp LoadCallerScript

LoadElmCallScript:
	callasm .LoadElmScript
	pause 30
	sjump Script_ReceivePhoneCall

.LoadElmScript:
	ld e, PHONE_ELM
	jp LoadCallerScript

RingTwice_StartCall:
	call .Ring
	call .Ring
	farcall StubbedTrainerRankings_PhoneCalls
	ret

.Ring:
	call Phone_StartRinging
	call Phone_Wait20Frames
	call Phone_CallerTextboxWithName
	call Phone_Wait20Frames
	call Phone_CallerTextbox
	call Phone_Wait20Frames
	call Phone_CallerTextboxWithName
	ret

Phone_CallerTextboxWithName:
	ld a, [wCurCaller]
	ld b, a
	call Function90363
	ret

PhoneCall::
	ld a, b
	ld [wPhoneScriptBank], a
	ld a, e
	ld [wPhoneCaller], a
	ld a, d
	ld [wPhoneCaller + 1], a
	call Phone_FirstOfTwoRings
	call Phone_FirstOfTwoRings
	farcall StubbedTrainerRankings_PhoneCalls
	ret

Phone_FirstOfTwoRings:
	call Phone_StartRinging
	call Phone_Wait20Frames
	call Phone_CallerTextboxWithName2
	call Phone_Wait20Frames
	call Phone_CallerTextbox
	call Phone_Wait20Frames
	call Phone_CallerTextboxWithName2
	ret

Phone_CallerTextboxWithName2:
	call Phone_CallerTextbox
	hlcoord 1, 2
	ld [hl], "☎"
	inc hl
	inc hl
	ld a, [wPhoneScriptBank]
	ld b, a
	ld a, [wPhoneCaller]
	ld e, a
	ld a, [wPhoneCaller + 1]
	ld d, a
	call FarPlaceString
	ret

Phone_NoSignal:
	ld de, SFX_NO_SIGNAL
	call PlaySFX
	jr Phone_CallEnd

HangUp::
	call HangUp_Beep
	call HangUp_Wait20Frames
Phone_CallEnd:
	call HangUp_BoopOn
	call HangUp_Wait20Frames
	call HangUp_BoopOff
	call HangUp_Wait20Frames
	call HangUp_BoopOn
	call HangUp_Wait20Frames
	call HangUp_BoopOff
	call HangUp_Wait20Frames
	call HangUp_BoopOn
	call HangUp_Wait20Frames
	call HangUp_BoopOff
	call HangUp_Wait20Frames
	ret

Function90316:
	ld de, SFX_SHUT_DOWN_PC
	call PlaySFX
	ret

HangUp_Beep:
	ld hl, PhoneClickText
	call PrintText
	ld de, SFX_HANG_UP
	call PlaySFX
	ret

PhoneClickText:
	text_far _PhoneClickText
	text_end

HangUp_BoopOn:
	ld hl, PhoneEllipseText
	call PrintText
	ret

PhoneEllipseText:
	text_far _PhoneEllipseText
	text_end

HangUp_BoopOff:
	call SpeechTextbox
	ret

Phone_StartRinging:
	call WaitSFX
	ld de, SFX_CALL
	call PlaySFX
	call Phone_CallerTextbox
	call UpdateSprites
	farcall PhoneRing_CopyTilemapAtOnce
	ret

HangUp_Wait20Frames:
	jr Phone_Wait20Frames

Phone_Wait20Frames:
	ld c, 10
	call DelayFrames
	farcall PhoneRing_CopyTilemapAtOnce
	ret

Function90363:
	push bc
	call Phone_CallerTextbox
	hlcoord 1, 1
	ld [hl], "☎"
	inc hl
	inc hl
	ld d, h
	ld e, l
	pop bc
	call Function90380
	ret

Phone_CallerTextbox:
	hlcoord 0, 0
	ld b, 2
	ld c, SCREEN_WIDTH - 2
	call Textbox
	ret

Function90380:
	ld h, d
	ld l, e
	ld a, b
	call GetCallerTrainerClass
	call GetCallerName
	ret

CheckCanDeletePhoneNumber:
	ld a, c
	call GetCallerTrainerClass
	ld a, c
	; and a
	ret nz
	ld a, b
	cp PHONECONTACT_MOM
	ret z
	cp PHONECONTACT_ELM
	ret z
	ld c, $1
	ret

GetCallerTrainerClass:
	push hl
	ld hl, PhoneContacts + PHONE_CONTACT_TRAINER_CLASS
	ld bc, PHONE_CONTACT_SIZE
	call AddNTimes
	ld a, [hli]
	ld b, [hl]
	ld c, a
	pop hl
	ret

GetCallerName:
	ld a, c
	and a
	jr z, .NotTrainer

	call Phone_GetTrainerName
	push hl
	push bc
	call PlaceString
	ld a, ":"
	ld [bc], a
	pop bc
	pop hl
	ld de, SCREEN_WIDTH + 3
	add hl, de
	call Phone_GetTrainerClassName
	call PlaceString
	ret

.NotTrainer:
	push hl
	ld c, b
	ld b, 0
	ld hl, NonTrainerCallerNames
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	call PlaceString
	ret

; Generic 'set bit' opcode call, for dynamic flag setting
; performs set a, [hl] (a is zero indexed) no flags set
SetBitAInHL:
	and a
	jr z, .first
	cp 1
	jr z, .second
	cp 2
	jr z, .third
	cp 3
	jr z, .fourth
	cp 4
	jr z, .fifth
	cp 5
	jr z, .sixth
	cp 6
	jr z, .seventh
	.eighth
	set 7, [hl]
	ret	
	.first
	set 0, [hl]
	ret
	.second
	set 1, [hl]
	ret
	.third
	set 2, [hl]
	ret
	.fourth
	set 3, [hl]
	ret
	.fifth
	set 4, [hl]
	ret
	.sixth
	set 5, [hl]
	ret
	.seventh
	set 6, [hl]
	ret

; Generic 'res bit' opcode call, for dynamic flag clearing
; performs res a, [hl] (a is zero indexed) no flags set
ResBitAInHL:
	and a
	jr z, .first
	cp 1
	jr z, .second
	cp 2
	jr z, .third
	cp 3
	jr z, .fourth
	cp 4
	jr z, .fifth
	cp 5
	jr z, .sixth
	cp 6
	jr z, .seventh
	.eighth
	res 7, [hl]
	ret	
	.first
	res 0, [hl]
	ret
	.second
	res 1, [hl]
	ret
	.third
	res 2, [hl]
	ret
	.fourth
	res 3, [hl]
	ret
	.fifth
	res 4, [hl]
	ret
	.sixth
	res 5, [hl]
	ret
	.seventh
	res 6, [hl]
	ret

; Generic 'bit' opcode call, for dynamic flag checking
; performs bit a, [hl] (a is zero indexed) and returns Z on no bit and NZ on set bit, as the real opcode.
CheckBitAInHL::
	and a
	jr z, .first
	cp 1
	jr z, .second
	cp 2
	jr z, .third
	cp 3
	jr z, .fourth
	cp 4
	jr z, .fifth
	cp 5
	jr z, .sixth
	cp 6
	jr z, .seventh
	.eighth
	bit 7, [hl]
	ret	
	.first
	bit 0, [hl]
	ret
	.second
	bit 1, [hl]
	ret
	.third
	bit 2, [hl]
	ret
	.fourth
	bit 3, [hl]
	ret
	.fifth
	bit 4, [hl]
	ret
	.sixth
	bit 5, [hl]
	ret
	.seventh
	bit 6, [hl]
	ret


; Generic 'bit' opcode call, for dynamic flag checking
; performs bit a, b (a is zero indexed) and returns Z on no bit and NZ on set bit, as the real opcode.
CheckBitAInB:
	and a
	jr nz, .not_first
	.first
	bit 0, b
	ret
	.not_first
	cp 1
	jr z, .second
	cp 2
	jr z, .third
	cp 3
	jr z, .fourth
	cp 4
	jr z, .fifth
	cp 5
	jr z, .sixth
	cp 6
	jr z, .seventh
	.eighth
	bit 7, b
	ret
	.second
	bit 1, b
	ret
	.third
	bit 2, b
	ret
	.fourth
	bit 3, b
	ret
	.fifth
	bit 4, b
	ret
	.sixth
	bit 5, b
	ret
	.seventh
	bit 6, b
	ret

INCLUDE "data/phone/non_trainer_names.asm"

Phone_GetTrainerName:
	push hl
	push bc
	farcall GetTrainerName
	pop bc
	pop hl
	ret

Phone_GetTrainerClassName:
	push hl
	push bc
	farcall GetTrainerClassName
	pop bc
	pop hl
	ret

GetCallerLocation:
	ld a, [wCurCaller]
	call GetCallerTrainerClass
	ld d, c
	ld e, b
	push de
	ld a, [wCurCaller]
	ld hl, PhoneContacts + PHONE_CONTACT_MAP_GROUP
	ld bc, PHONE_CONTACT_SIZE
	call AddNTimes
	ld b, [hl]
	inc hl
	ld c, [hl]
	push bc
	call GetWorldMapLocation
	ld e, a
	farcall GetLandmarkName
	pop bc
	pop de
	ret

INCLUDE "data/phone/phone_contacts.asm"

INCLUDE "data/phone/special_calls.asm"

PhoneOutOfAreaScript:
	writetext PhoneOutOfAreaText
	end

PhoneOutOfAreaText:
	text_far _PhoneOutOfAreaText
	text_end

PhoneScript_JustTalkToThem:
	writetext PhoneJustTalkToThemText
	end

PhoneJustTalkToThemText:
	text_far _PhoneJustTalkToThemText
	text_end

PhoneThankYouTextScript:
	writetext PhoneThankYouText
	end

PhoneThankYouText:
	text_far _PhoneThankYouText
	text_end
